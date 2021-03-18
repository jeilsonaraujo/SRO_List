import 'dart:ui';

import 'package:flutter/material.dart';

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

class _ViewListaState extends State<ViewLista> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //-----------------------------------------------------------------------
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
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
                                  Icon(Icons.add_box_outlined),
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
                                    Icons.map,
                                    color: Color(0xff808080),
                                  ),
                                  Expanded(
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Text(
                                          "AV JOAQUIM LAZARO C" + ", " + "574",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
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
                    ),
                    //---------------------------------------------------------------
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
