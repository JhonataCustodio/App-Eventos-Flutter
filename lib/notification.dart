import 'package:flutter/material.dart';
import 'package:badges/badges.dart';



class Notificacao extends StatelessWidget {
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
                            color: Colors.white
                            
                          ),
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
                                Icons.history,
                                color: Colors.grey[300],
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              "Atualizar",
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
                  SizedBox(
                    height: 30,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: const Text('Notificações'),

          backgroundColor: Colors.black,
          // title: const Text(''),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.notifications_active,
                color: Colors.grey[400],
              ),
              onPressed: () {
                //
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
            child: Card(
              child: ListTile(
                leading: Image(image: AssetImage("imagens.dart/Untitled5.png")),
                title: Text('Menssagem'),
                subtitle: Text('Data 08/11/1997'),
                trailing: Icon(Icons.cancel,
                  color: Colors.red,
                ),
              ),
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
  }
}