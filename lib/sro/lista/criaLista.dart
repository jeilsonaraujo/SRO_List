import 'package:barcode_scan/barcode_scan.dart';

import 'package:flutter/material.dart';

import 'package:sro_list/sro/lista/viewList.dart';
import 'dart:async';

import 'package:flutter/cupertino.dart';

class CriarLista extends StatefulWidget {
  @override
  _CriarListaState createState() => _CriarListaState();
}

final TextEditingController _objeto = TextEditingController();
final TextEditingController _logradouro = TextEditingController();
final TextEditingController _numero = TextEditingController();
final FocusNode focusObjetoNode = FocusNode();
final FocusNode focusLogradouroNode = FocusNode();
final FocusNode focusNumeroNode = FocusNode();
bool _numeric = false;

class _CriarListaState extends State<CriarLista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4.0,
                    vertical: 8.0,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 15,
                          ),
                          Icon(CupertinoIcons.cube_box),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextField(
                                maxLength: 13,
                                controller: _objeto,
                                textCapitalization:
                                    TextCapitalization.characters,
                                autofocus: true,
                                focusNode: focusObjetoNode,
                                keyboardType: _numeric
                                    ? TextInputType.number
                                    : TextInputType.text,
                                onChanged: (String value) async {
                                  if (_objeto.text.length < 2) if (_objeto
                                              .text.length >
                                          1 &&
                                      _objeto.text.length < 11) {
                                    setState(() {
                                      _numeric = true;
                                    });
                                  }
                                  if (_objeto.text.length == 11) {
                                    setState(() {
                                      _numeric = false;
                                    });
                                    //keyboardType: joinlinkname.value

                                  }
                                  if (_objeto.text.length == 13) {
                                    focusLogradouroNode.requestFocus();
                                  }
                                },
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              scan();
                            },
                            child: Icon(
                              Icons.search,
                            ),
                          ),
                          Container(
                            width: 15,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 15,
                          ),
                          Icon(
                            Icons.map,
                            color: Color(0xff808080),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextField(
                                controller: _logradouro,
                                focusNode: focusLogradouroNode,
                                textCapitalization:
                                    TextCapitalization.characters,
                                onSubmitted: (String value) async {
                                  focusNumeroNode.requestFocus();
                                },
                              ),
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
                            Icons.home,
                            color: Color(0xff808080),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextField(
                                maxLength: 6,
                                controller: _numero,
                                focusNode: focusNumeroNode,
                                keyboardType: TextInputType.number,
                                onChanged: (String value) async {},
                              ),
                            ),
                          ),
                          Container(
                            width: 105,
                          )
                        ],
                      ),
                      Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MaterialButton(
                              child: Text("Ver Lista"),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ViewLista()));
                              }),
                          MaterialButton(
                              child: Text("Limpar"),
                              onPressed: () {
                                _objeto.clear();
                                _logradouro.clear();
                                _numero.clear();
                                focusObjetoNode.requestFocus();
                              }),
                          MaterialButton(
                              child: Text("Adicionar"), onPressed: () {})
                        ],
                      ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

Future scan() async {
  String barcode = await BarcodeScanner.scan();
  _objeto.text = barcode;
  focusLogradouroNode.requestFocus();
}
