import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:munch_v4/res/dimensions.dart';
import 'package:munch_v4/widget/app_large_text.dart';


import '../../res/colors.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({Key? key}) : super(key: key);

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  String? Result;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: Dimensions.height45 * 10, left: Dimensions.width45 * 2.5),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.mainColor,
                    onPrimary: Colors.black,
                  ),
                  icon: Icon(Icons.camera_alt_outlined),
                  onPressed: scanBarcode,
                  label: AppLargeText(
                    text: "Start Scan",
                    color: Colors.black,
                  )),
              AppLargeText(
                  text: Result == null ? 'nothing scaned yet' : 'Scan Result : ${Result}',color: Colors.black,size: 10,),
            ]),
    );
  }

  Future scanBarcode() async {
    String scanResult;
    try {
      scanResult = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);
    } on PlatformException {
      scanResult = "Failed to get the barcode number";
    }
    if(scanResult == null && mounted)
    return;

    setState(() => this.Result = scanResult);
  }
}
