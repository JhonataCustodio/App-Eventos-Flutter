import 'dart:math';

import 'package:flutter/material.dart';
import 'package:localizeja/criar_evento.dart';

class ApresentacaoEventos extends StatefulWidget {
  @override
  _ApresentacaoEventosState createState() => _ApresentacaoEventosState();
}

class _ApresentacaoEventosState extends State<ApresentacaoEventos> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _handleSignIn;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text("Criar Eventos"),
        leading: new IconButton(
          icon: new Icon(Icons.add_to_photos,
          color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Card(
          color: Colors.black,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),
                  Card(
                    color: Colors.yellow,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        new Container(
                            alignment: Alignment.topCenter,
                            padding: EdgeInsets.all(150),
                            //width: 300,
                            height: 200.0,
                            decoration: new BoxDecoration(
                                shape: BoxShape.rectangle,
                                image: new DecorationImage(
                                  alignment: Alignment.center,
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    "imagens.dart/Untitled6.png",
                                  ),
                                ))),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 05,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),
                  Card(
                    color: Colors.yellow,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        new Container(
                            alignment: Alignment.topCenter,
                            padding: EdgeInsets.all(150),
                            //width: 300,
                            height: 200.0,
                            decoration: new BoxDecoration(
                                shape: BoxShape.rectangle,
                                image: new DecorationImage(
                                  //alignment: Alignment.center,
                                  fit: BoxFit.contain,
                                  image: AssetImage(
                                    "imagens.dart/Untitled7.png",
                                  ),
                                ))),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 15,
                  ),
                  FlatButton(
                    child: Row(
                      children: <Widget>[
                        Text(
                          ' Voltar ',
                          style: TextStyle(color: Colors.red, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Icon(
                          Icons.arrow_back,
                          color: Colors.red,
                        ),
                      ],
                    ),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                   RaisedButton(
                     color: Colors.white,
                    onPressed: () {
                      _scaffoldKey.currentState.showSnackBar(new SnackBar(
                        backgroundColor: Colors.blueGrey[200],
                        content: Text('Mais: '),
                        action: SnackBarAction(
                          label: 'Clique para carregar o formulário',
                          textColor: Colors.blueGrey,
                          onPressed: () {
                          Navigator.pop(context);
                           Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CriarEvento()),
                            );
                          },
                        ),
                        duration: new Duration(seconds: 10), 
                           
                      ));
                      final snackBar = SnackBar();
                      // Encontra o Scaffold na árvore de widgets
                      // e o usa para exibir o SnackBar!
                      Scaffold.of(context).showSnackBar(snackBar);
                    },
                    
                    child: FlatButton(
                    child: Row(
                      children: <Widget>[
                        Text(
                          ' Proximo ',
                          style: TextStyle(color: Colors.green, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.green,
                        ),
                      ],
                    ),
                    color: Colors.white,
                    
                  ),
                    
                  ),
                  
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
