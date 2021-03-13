import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

class ScanObjeto extends StatefulWidget {
  @override
  _ScanObjetoState createState() => _ScanObjetoState();
}

class _ScanObjetoState extends State<ScanObjeto> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        home: CupertinoPageScaffold(
            child: CupertinoButton(
      child: Text("Scan"),
      onPressed: scan,
    )));
  }
}

Future scan() async {
  String barcode = await BarcodeScanner.scan();
  print(barcode);
}
