import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> foto() {
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
                            width: 100.0,
                            height: 140.0,
                            decoration: new BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("imagens.dart/Untitled3.png"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Row(
                  children: <Widget>[
                    Card(
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.settings_applications,
                              color: Colors.yellow[600],
                            ),
                            onPressed: () {
                              //
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    new Text(
                      "Seu Perfil",
                      textScaleFactor: 1.3,
                      style: TextStyle(color: Colors.blueGrey[400]),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.account_circle,
                      color: Colors.blueGrey[400],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const Divider(
            color: Colors.blueGrey,
            height: 20,
            thickness: 0.5,
            indent: 40,
            endIndent: 40,
        ),
        Container(
          child: Card(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    FlatButton(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.account_box,
                            color: Colors.blueGrey[600],
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Nome: Jhonata Silva ',
                            style: TextStyle(color: Colors.blueGrey[300]),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                      color: Colors.white,
                      onPressed: () {/* ... */},
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    FlatButton(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.assignment_late,
                            color: Colors.blueGrey[600],
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Descrição: Developer ',
                            style: TextStyle(color: Colors.blueGrey[300]),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                      color: Colors.white,
                      onPressed: () {/* ... */},
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    FlatButton(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.attachment,
                            color: Colors.blueGrey[600],
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Redes sociais: @jhonata_csilva ',
                            style: TextStyle(color: Colors.blueGrey[300]),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                      color: Colors.white,
                      onPressed: () {/* ... */},
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    FlatButton(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.assistant_photo,
                            color: Colors.blueGrey[600],
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Cidade: São Paulo - SP',
                            style: TextStyle(color: Colors.blueGrey[300]),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                      color: Colors.white,
                      onPressed: () {/* ... */},
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ];
    }

    return new Scaffold(
      appBar: new AppBar(
          //title: const Text('LocalizeJA'),

          backgroundColor: Colors.black,
          // title: const Text(''),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.account_circle,
                color: Colors.grey[400],
              ),
              onPressed: () {
                //
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
                            children: foto(),
                          ))),
                    ]),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
