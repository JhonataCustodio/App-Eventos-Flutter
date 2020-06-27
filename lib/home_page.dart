//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:localizeja/auth.dart';
import 'package:badges/badges.dart';
import 'package:localizeja/perfil.dart';
import 'package:localizeja/notification.dart';
import 'package:localizeja/criar_evento.dart';
import 'package:localizeja/localizacao.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:localizeja/apresentacao_eventos.dart';

class HomePage extends StatelessWidget {
  HomePage({this.auth, this.onSignOut});
  final BaseAuth auth;
  final VoidCallback onSignOut;

  GoogleMapController mapController;

  final LatLng _center = const LatLng(-23.5489, -46.6388);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    void _signOut() async {
      try {
        await auth.signOut();
        onSignOut();
      } catch (e) {
        print(e);
      }
    }

    void _buttonCentral(context) {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext bc) {
            return Container(
              color: Colors.white,
              child: new Wrap(
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Container(
                            height: 2,
                            width: 360,
                            //padding: const EdgeInsets.all(180.0),
                            color: Colors.green,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Container(
                              height: 01,
                              width: 360,
                              //padding: const EdgeInsets.all(180.0),
                              color: Colors.white),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Container(
                            height: 2,
                            width: 360,
                            //padding: const EdgeInsets.all(180.0),
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      FlatButton(
                        child: Row(
                          children: <Widget>[
                            Badge(
                              badgeColor: Colors.grey[200],
                              badgeContent: Text(''),
                              child: Icon(
                                Icons.home,
                                color: Colors.grey[300],
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              "Home",
                              style: TextStyle(
                                color: Colors.grey[600],
                              ),
                            )
                          ],
                        ),
                        color: Colors.white,
                        onPressed: () {/* ... */},
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      FlatButton(
                        child: Row(
                          children: <Widget>[
                            Badge(
                              badgeColor: Colors.green[200],
                              badgeContent: Text(''),
                              child: Icon(
                                Icons.message,
                                color: Colors.grey[300],
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              "Mensagens de Eventos",
                              style: TextStyle(
                                color: Colors.grey[600],
                              ),
                            )
                          ],
                        ),
                        color: Colors.white,
                        onPressed: () {/* ... */},
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      FlatButton(
                        child: Row(
                          children: <Widget>[
                            Badge(
                              badgeColor: Colors.green[200],
                              badgeContent: Text(''),
                              child: Icon(
                                Icons.settings,
                                color: Colors.grey[300],
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              "Configurações",
                              style: TextStyle(
                                color: Colors.grey[600],
                              ),
                            )
                          ],
                        ),
                        color: Colors.white,
                        onPressed: () {/* ... */},
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      FlatButton(
                        child: Row(
                          children: <Widget>[
                            Badge(
                              badgeColor: Colors.green[200],
                              badgeContent: Text(''),
                              child: Icon(
                                Icons.add_to_photos,
                                color: Colors.grey[300],
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              "Criar evento",
                              style: TextStyle(
                                color: Colors.grey[600],
                              ),
                            )
                          ],
                        ),
                        color: Colors.white,
                        onPressed: () {/* ... */},
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Container(
                          height: 2,
                          padding: const EdgeInsets.all(180.0),
                          decoration: new BoxDecoration(
                              image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("imagens.dart/Untitled4.png"),
                          ))),
                    ],
                  ),
                ],
              ),
            );
          });
    }

    showAlertDialog2(BuildContext context) {
      Widget continuaButton =  FlatButton(
          color: Colors.black45,
           child: Row(
            children: <Widget>[
              Text(
                 'Expadir  ',
                    style: TextStyle(
                    color: Colors.green,
                  ),
              ),
              Icon(
                Icons.fullscreen,
                   color: Colors.green,
                ),
            ],
            ),
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Localizacao()),
              );
            },
        );      
     
      Widget cancelaButton = FlatButton(
          color: Colors.black45,
           child: Row(
            children: <Widget>[
              Text(
                 'Voltar  ',
                    style: TextStyle(
                    color: Colors.red[600],
                  ),
              ),
              Icon(
                Icons.arrow_left,
                   color: Colors.red[600],
                ),
            ],
            ),
            onPressed: () {
              Navigator.pop(context);
              
            },
        ); 
        
      //configura o AlertDialog
      AlertDialog alert = AlertDialog(
        backgroundColor: Colors.black38,
        content: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
            target: _center,
              zoom: 11.0,
        )),
        actions: [
          cancelaButton,
          continuaButton,
        ],
      );
      //exibe o diálogo
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    List<Widget> card() {
      return [
        Container(
          child: Card(
            color: Colors.white,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                    ),
                    Card(
                      color: Colors.deepPurple,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Container(
                              width: 60.0,
                              height: 70.0,
                              decoration: new BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        "imagens.dart/Untitled3.png"),
                                  ))),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                new Text(
                  "Crie eventos",
                  textScaleFactor: 1.3,
                  style: TextStyle(color: Colors.deepPurple[600]),
                ),
                SizedBox(
                  width: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const <Widget>[
                    Icon(
                      Icons.favorite,
                      color: Colors.pink,
                      size: 18.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                    Icon(
                      Icons.audiotrack,
                      color: Colors.green,
                      size: 24.0,
                    ),
                    Icon(
                      Icons.beach_access,
                      color: Colors.orange,
                      size: 28.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          child: Card(
            color: Colors.white,
            child: Row(
              children: <Widget>[
                FlatButton(
                  child: Row(
                    children: <Widget>[
                      Text(
                        ' Clique para criar o evento ',
                        style: TextStyle(color: Colors.green[600]),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.add_to_photos,
                        color: Colors.green[600],
                      ),
                    ],
                  ),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ApresentacaoEventos()),
                    );
                  },
                ),
              ],
            ),
          ),
        )
      ];
    }

    List<Widget> corpo() {
      return [
        Container(
          child: Card(),
        ),
        Container(
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      width: 100,
                    ),
                    Badge(
                      badgeColor: Colors.white,
                      shape: BadgeShape.square,
                      borderRadius: 5,
                      toAnimate: false,
                      child: Icon(
                        Icons.visibility,
                        color: Colors.green[300],
                        //size: 10,
                      ),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Badge(
                      badgeColor: Colors.deepPurple,
                      shape: BadgeShape.square,
                      borderRadius: 5,
                      toAnimate: false,
                      badgeContent: Text('Jhonata',
                          style: TextStyle(color: Colors.white)),
                      child: Icon(
                        Icons.visibility,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Icon(
                      Icons.more_vert,
                    )
                  ],
                ),
                const ListTile(
                  leading: Icon(
                    Icons.favorite_border,
                    color: Colors.orange,
                  ),
                  title: Text(
                    'Nome do evento ',
                    style: TextStyle(fontSize: 18, color: Colors.deepPurple),
                  ),
                  subtitle: Text(
                    'Data - 08/11/2020',
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ),
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Localização  ',
                            style: TextStyle(
                              color: Colors.orange[900],
                            ),
                          ),
                          Icon(
                            Icons.explore,
                            color: Colors.orange[900],
                          ),
                        ],
                      ),
                      color: Colors.white,
                      onPressed: () {
                        showAlertDialog2(context);
                      },
                    ),
                    FlatButton(
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Informações',
                            style: TextStyle(
                              color: Colors.black38,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black38,
                          ),
                        ],
                      ),
                      color: Colors.white,
                      onPressed: () {/* ... */},
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Container(
                        height: 2,
                        padding: const EdgeInsets.all(156.0),
                        decoration: new BoxDecoration(
                            image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("imagens.dart/Untitled4.png"),
                        ))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ];
    }

    List<Widget> segundoCard() {
      return [
        Container(
          child: Card(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      width: 100,
                    ),
                    Badge(
                      badgeColor: Colors.white,
                      shape: BadgeShape.square,
                      borderRadius: 5,
                      toAnimate: false,
                      child: Icon(
                        Icons.visibility_off,
                        color: Colors.red[300],
                        //size: 10,
                      ),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Badge(
                      badgeColor: Colors.deepPurple,
                      shape: BadgeShape.square,
                      borderRadius: 5,
                      toAnimate: false,
                      badgeContent: Text('Jhonata',
                          style: TextStyle(color: Colors.white)),
                      child: Icon(
                        Icons.visibility,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Icon(
                      Icons.more_vert,
                    )
                  ],
                ),
                const ListTile(
                  leading: Icon(
                    Icons.favorite_border,
                    color: Colors.orange,
                  ),
                  title: Text(
                    'Nome do evento - (Jho)',
                    style: TextStyle(fontSize: 18, color: Colors.deepPurple),
                  ),
                  subtitle: Text(
                    'Data - 08/11/2020',
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ),
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Localização  ',
                            style: TextStyle(
                              color: Colors.orange[900],
                            ),
                          ),
                          Icon(
                            Icons.explore,
                            color: Colors.orange[900],
                          ),
                        ],
                      ),
                      color: Colors.white,
                      onPressed: () {/* ... */},
                    ),
                    FlatButton(
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Informações',
                            style: TextStyle(
                              color: Colors.black38,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black38,
                          ),
                        ],
                      ),
                      color: Colors.white,
                      onPressed: () {/* ... */},
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Container(
                        height: 2,
                        padding: const EdgeInsets.all(156.0),
                        decoration: new BoxDecoration(
                            image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("imagens.dart/Untitled4.png"),
                        ))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ];
    }

    return new Scaffold(
      appBar: new AppBar(
        title: const Text('LocalizeJA'),
        bottom: AppBar(
            backgroundColor: Colors.black,
            title: const Text(''),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.grey[400],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Perfil()),
                  );
                },
              ),
              // action button
              IconButton(
                icon: Icon(
                  Icons.notifications_active,
                  color: Colors.grey[400],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Notificacao()),
                  );
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.grey[400],
                ),
                onPressed: () {
                  //_select(choices[1]);
                },
              ),
              SizedBox(
                width: 10,
              ),

              IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.red,
                ),
                onPressed: () {
                  //_select(choices[1]);
                },
              ),

              SizedBox(
                width: 15,
              ),
            ]),
      ),
      body: new Container(
        color: Colors.blueGrey[50],
        child: new ListView(
          children: <Widget>[
            Column(children: [
              new Card(
                  color: Colors.white,
                  child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Container(
                            padding: const EdgeInsets.all(16.0),
                            child: new Form(
                                //key: formKey,
                                child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: card(),
                            ))),
                      ])),

              new Card(
                  color: Colors.white,
                  child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Container(
                          padding: const EdgeInsets.all(16.0),
                          child: new Form(
                            //key: formKey,
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: corpo(),
                            ),
                          ),
                        ),
                        new Container(
                          padding: const EdgeInsets.all(16.0),
                          child: new Form(
                              //key: formKey,
                              child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: segundoCard(),
                          )),
                        ),
                      ])),
              //hintText()
            ]),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () => {
          _buttonCentral(context),
        },
        tooltip: 'Increment Counter',
        child: Icon(Icons.library_books),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
    //hintText()
  }
}
