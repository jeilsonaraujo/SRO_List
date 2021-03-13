import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'login.dart';

class CriarLista extends StatefulWidget {
  @override
  _CriarListaState createState() => _CriarListaState();
}

final TextEditingController _objeto = TextEditingController();
final TextEditingController _alertTextFieldController = TextEditingController();
final FocusNode focusNode = FocusNode();

class _CriarListaState extends State<CriarLista> {
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
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4.0,
                    vertical: 8.0,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.cube_box,
                        color: Color(0xff808080),
                      ),
                      Expanded(
                        child: CupertinoTextField(
                          maxLength: 13,
                          controller: _objeto,
                          focusNode: focusNode,
                          cursorColor: CupertinoColors.activeBlue,
                          onChanged: (String value) async {
                            if (_objeto.text.length == 13) {
                              print("Abrir janela");
                              return showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('TextField in Dialog'),
                                      content: TextField(
                                        onChanged: (value) {},
                                        controller: _alertTextFieldController,
                                        decoration: InputDecoration(
                                            hintText: "Text Field in Dialog"),
                                      ),
                                    );
                                  });
                            }
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _objeto.clear();
                        },
                        child: Icon(
                          CupertinoIcons.search,
                          color: Color(0xff000000),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
