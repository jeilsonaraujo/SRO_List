import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sro_list/verLista.dart';

import 'criaLista.dart';

class Cadastrar extends StatefulWidget {
  @override
  _CadastrarState createState() => _CadastrarState();
}

class _CadastrarState extends State<Cadastrar> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.add)),
            BottomNavigationBarItem(icon: Icon(Icons.view_list))
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return CriarLista();
              break;
            case 1:
              return ListaView();
              break;
            default:
              return CriarLista();
          }
        },
      ),
    );
  }
}
