import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:munch_v4/res/app_constants.dart';
import 'package:munch_v4/res/dimensions.dart';
import 'package:munch_v4/widget/app_large_text.dart';

import '../../helper/databaseHandler.dart';
import '../../models/ingredients.dart';
import '../../res/colors.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({Key? key}) : super(key: key);

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  late DatabaseHandler handler;

  @override
  void initState() {
    super.initState();
    this.handler = DatabaseHandler();
    this.handler.initializeDB().whenComplete(() async {
      await this.addUsers();
      setState(() {});
    });
  }

  Future<int> addUsers() async {
    Ingredients gum = Ingredients(
        id: 012546011112,
        name: "Trident Sugar Free Gum Tropical Twist",
        stars: 4,
        img: "https://images.barcodelookup.com/2743/27438419-1.jpg");
    List<Ingredients> listOfUsers = [
      gum,
    ];
    return await handler.insertUser(listOfUsers);
  }

  String? Result;
  @override
  Widget build(BuildContext context) {
    if (Result == null) {
      return Scaffold(
        body: Container(
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
                  text: 'nothing scaned yet',
                  color: Colors.black,
                  size: 10,
                ),
              ]),
        ),
      );
    } else {
      return Scaffold(
          body: FutureBuilder(
              future: this.handler.retrieveUsers(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Ingredients>> snapshot) {
                int index = -1;
                if (snapshot.hasData) {
                  for (int i = 0; i < snapshot.data!.length; i++) {
                    if (snapshot.data![i].id == int.parse(Result.toString())) {
                      index = i;
                    }
                  }
                  return AlertDialog(
                    title: AppLargeText(
                      text: snapshot.data![index].name.toString(),
                    ),
                    content: Column(children: [
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      Container(
                        height: Dimensions.height10 * 50,
                        width: Dimensions.width10 * 30,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(snapshot.data![index].img),
                        )),
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      AppLargeText(text: "Is this the item scanned?"),
                    ]),
                    actions: <Widget>[
                      ElevatedButton(
                        child: const Text("Add to cart"),
                        onPressed: () {
                          setState(() => Result = null);
                          Navigator.of(
                            context,
                          ).pop();
                        },
                      ),
                      ElevatedButton(
                        child: const Text("Cancel"),
                        onPressed: () {
                          setState(() => Result = null);
                          Navigator.of(
                            context,
                          ).pop();
                        },
                      ),
                    ],
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }));
    }
  }

  Future scanBarcode() async {
    String scanResult;
    try {
      scanResult = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);
    } on PlatformException {
      scanResult = "Failed to get the barcode number";
    }
    if (scanResult == null && mounted) return;

    setState(() => this.Result = scanResult);
    // sendData(scanResult);
  }

  Widget _buildPopupDialog(BuildContext context) {
    // ignore: unnecessary_new
    return new AlertDialog(
      title: const Text('Popup example'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Is this what you scanned?"),
          AppLargeText(text: Result.toString())
        ],
      ),
      actions: <Widget>[
        // ignore: unnecessary_new
        new ElevatedButton(
          onPressed: () {
            setState(() => this.Result = null);
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Add to cart'),
        ),
      ],
    );
  }

  // Future sendData(String num) async {
  //   final response = await http.post(
  //     Uri.parse(AppConstants.baseUrl + AppConstants.uploadsUrl + "barcode.Json"),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'barcode': '$num',
  //     }),
  //   );

  //   if (response.statusCode == 200) {
  //     // If the server did return a 201 CREATED response,
  //     // then parse the JSON.
  //     print("made a new directory of barcode.txt");
  //   } else {
  //     // If the server did not return a 201 CREATED response,
  //     // then throw an exception.
  //     throw Exception('Failed to create album.');
  // }
  // }
}
