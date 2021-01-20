import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _scanBarcode = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
        "#ff6666", "Cancel", true, ScanMode.BARCODE)
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#66ff66", "Cancel", true, ScanMode.QR);
      print("codee :::::::::::::::::");
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text('Verificador de donantes')),
            body: Builder(builder: (BuildContext context) {
              return Container(
                  alignment: Alignment.center,
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                    children: <Widget> [
                      TextField(
                        autofocus: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3.0)
                          ),
                          counter: Text("Letras 0"),
                          hintText: 'Número de cedula de identidad',
                          helperText: 'Ej 5433232 - 4534333-1K',
                          icon: Icon(Icons.account_circle)
                        ),
                        onChanged: (valor) {
                          print(valor);
                        }
                      )
                    ],
                  ));
            }),
          floatingActionButton: FloatingActionButton(
            onPressed:  () => setState(() {
              scanQR();
            }),
            tooltip: 'Escanear QR',
            child: Icon(Icons.qr_code_scanner),
          ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: Container(
              height: 50.0,
            ),
          ),
        )
    );

  }
}
