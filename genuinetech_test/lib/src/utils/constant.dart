import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const String baseLink = 'https://www.pqstec.com/InvoiceApps/Values/';
const String baseImg = 'https://www.pqstec.com/InvoiceApps/';

showToast(String title) {
  return Fluttertoast.showToast(
      msg: title,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}
