import 'package:flutter/material.dart';

import 'colores.dart';

class HelperModal {
  static Container modalConfirmation(
      {BuildContext context,
        Function() onPressed,
        String message,
        String title}) {
    // double cHeight = MediaQuery.of(context).size.height * 0.35;
    double cWidth = MediaQuery.of(context).size.width * 0.8;
    return Container(
      width: double.infinity,
      color: Color.fromRGBO(0, 0, 0, 0.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // height: cHeight,
              width: cWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Text(
                      title,
                      style: TextStyle(
                          color: ColorApp.btnBackground,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.none),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 5, left: 10, right: 10, bottom: 10),
                    child: Text(
                      message,
                      style: TextStyle(
                          color: ColorApp.colorGrisClaro,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w200,
                          decoration: TextDecoration.none),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton(
                        child: Text(
                          "Volver",
                          style:
                          TextStyle(color: ColorApp.greyText, fontSize: 12),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      FlatButton(
                          padding: EdgeInsets.all(0.0),
                          onPressed: () {
                            onPressed();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: ColorApp.colorGreen,
                            ),
                            padding: EdgeInsets.only(
                                top: 10, bottom: 10, left: 15, right: 15),
                            child: Text(
                              'Continuar',
                              style:
                              TextStyle(color: Colors.white, fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              side: BorderSide(color: ColorApp.colorGreen))),
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
