import 'package:flutter/cupertino.dart';
import 'package:sro_list/home.dart';
import 'package:sro_list/login.dart';

void main(List<String> args) {
  runApp(CupertinoApp(
    initialRoute: '/',
    routes: {'/': (context) => Login(), '/cadastro': (context) => Cadastrar()},
  ));
}
