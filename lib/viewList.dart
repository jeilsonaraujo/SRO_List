import 'dart:ui';

import 'package:flutter/cupertino.dart';

import 'database_helper.dart';
import 'login.dart';

class ViewLista extends StatefulWidget {
  @override
  _ViewListaState createState() => _ViewListaState();
}

final TextEditingController _objeto = TextEditingController();
final TextEditingController _logradouro = TextEditingController();
final TextEditingController _numero = TextEditingController();
final FocusNode focusObjetoNode = FocusNode();
final FocusNode focusLogradouroNode = FocusNode();
final FocusNode focusNumeroNode = FocusNode();

final dbHelper = DatabaseHelper.instance;

class _ViewListaState extends State<ViewLista> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
          backgroundColor: CupertinoColors.white,
          navigationBar: CupertinoNavigationBar(
            backgroundColor: Color.fromRGBO(247, 243, 240, 2),
            leading: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CupertinoButton(
                    padding: EdgeInsets.all(0),
                    child: Text('Sair'),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          CupertinoPageRoute(builder: (context) => Login()));
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 15.0),
                    child: Container(
                      height: 8.0,
                      width: 8.0,
                    ),
                  ),
                ]),
            middle: Image.asset(
              'assets/logo_correios.png',
              width: 120,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey5,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0.0,
                      vertical: 0.0,
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 15,
                            ),
                            Icon(
                              CupertinoIcons.cube_box,
                              color: Color(0xff808080),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                child: Text("PU123456789BR",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 15,
                            ),
                            Icon(
                              CupertinoIcons.map,
                              color: Color(0xff808080),
                            ),
                            Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Text(
                                    "AV JOAQUIM LAZARO C" + ", " + "574",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ],
                        ),
                        Container(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

// ignore: unused_element
void _insert() async {
  // row to insert
  Map<String, dynamic> row = {
    DatabaseHelper.columnObjeto: _objeto.text,
    DatabaseHelper.columnLogradouro: _logradouro.text,
    DatabaseHelper.columnNumero: _numero.text
  };
  final id = await dbHelper.insert(row);
  print('inserted row id: $id');
  _objeto.clear();
  _logradouro.clear();
  _numero.clear();
  focusObjetoNode.requestFocus();
}
