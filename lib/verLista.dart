import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class ListaView extends StatefulWidget {
  @override
  _ListaViewState createState() => _ListaViewState();
}

class _ListaViewState extends State<ListaView> {
  final TextEditingController _objeto = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
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
          middle: Image.network(
            'https://www.correios.com.br/++theme++correios.site.tema/images/logo_correios.png',
            width: 120,
          ),
        ),
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DecoratedBox(
                    //OBJETO
                    decoration: BoxDecoration(
                      color: CupertinoColors.systemGrey5,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4.0,
                        vertical: 0.0,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                CupertinoIcons.cube_box,
                                color: Color(0xff808080),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Expanded(
                                  child: Text("DA110210342BR"),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "AV ANTONIO CARLOS MAGALHAES" +
                                        " Nº " +
                                        "560",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
