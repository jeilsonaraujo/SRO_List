import 'package:flutter/material.dart';
import 'package:sro_list/sro/login.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {'/': (context) => Login()},
  ));
}
