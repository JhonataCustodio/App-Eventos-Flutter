import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:localizeja/home_page.dart';
import 'package:localizeja/criar_evento.dart';
import 'package:localizeja/contacts-list.dart';


class CriarEvento2 extends StatefulWidget {
  @override
  _CriarEvento2State createState() => _CriarEvento2State();
}

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class _CriarEvento2State extends State<CriarEvento2> {
  String _value = '';
  bool _value1 = false;
  bool _value2 = false;

  //we omitted the brackets '{}' and are using fat arrow '=>' instead, this is dart syntax
  void _value1Changed(bool value) => setState(() => _value1 = value);
  void _value2Changed(bool value) => setState(() => _value2 = value);

  @override
  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2016),
        lastDate: new DateTime(2040));
    if (picked != null) setState(() => _value = picked.toString());
  }

  localizacao(BuildContext context) {
    Widget continuaButton = FlatButton(
      color: Colors.black45,
      child: Row(
        children: <Widget>[
          Text(
            'Expadir  ',
            style: TextStyle(
              color: Colors.deepPurple,
            ),
          ),
          Icon(
            Icons.fullscreen,
            color: Colors.deepPurple,
          ),
        ],
      ),
      onPressed: () {
        Navigator.pop(context);
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
        content: TextField(
          decoration: new InputDecoration(
            labelText: 'Nome da Cidade: ',
            labelStyle: TextStyle(
              color: Colors.blueGrey,
              fontSize: 16,
            ),
          ),
        ));
    actions:
    [
      cancelaButton,
      continuaButton,
    ];

    //exibe o diálogo
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  List<Widget> usernameAndPassword() {
    return [
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
                  badgeColor: Colors.white,
                  badgeContent: Text(''),
                  child: Icon(
                    Icons.explore,
                    color: Colors.yellow[600],
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Localização",
                  style: TextStyle(
                    color: Colors.blueGrey,
                  ),
                )
              ],
            ),
            color: Colors.white,
            onPressed: () {
              showAlertDialog2(context);
            },
          ),
        ],
      ),
      SizedBox(
        height: 10,
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
                  badgeColor: Colors.white,
                  badgeContent: Text(''),
                  child: Icon(
                    Icons.feedback,
                    color: Colors.yellow[600],
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Convites",
                  style: TextStyle(
                    color: Colors.blueGrey,
                  ),
                )
              ],
            ),
            color: Colors.white,
            onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListaDeContatos()),
                  );
                },
          ),
        ],
      ),
      SizedBox(
        height: 10,
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
                  badgeColor: Colors.white,
                  badgeContent: Text(''),
                  child: Icon(
                    Icons.fastfood,
                    color: Colors.yellow[600],
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Comes e Bebes",
                  style: TextStyle(
                    color: Colors.blueGrey,
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
        height: 20,
      ),
      new Column(
        children: <Widget>[
          // new Text(_data =_value,),

          new RaisedButton(
            onPressed: _selectDate,
            color: Colors.yellow[50],
            child: new Text(
              'Clique para selecionar a Data ',
              style: TextStyle(fontSize: 14, color: Colors.blueGrey),
            ),
            //validator: (val) => val.isEmpty ? _kTestValue : null,
          ),
          Badge(
            badgeColor: Colors.yellow[600],
            badgeContent: Icon(
              Icons.calendar_today,
              size: 16,
              color: Colors.white,
            ),
            shape: BadgeShape.square,
            borderRadius: 5,
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: <Widget>[
              Badge(
                badgeColor: Colors.white,
                badgeContent: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 24,
                    color: Colors.red[600],
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                shape: BadgeShape.square,
                borderRadius: 50,
              ),
              SizedBox(
                width: 10,
              ),
              Badge(
                badgeColor: Colors.white,
                badgeContent: IconButton(
                  icon: Icon(
                    Icons.arrow_forward,
                    size: 24,
                    color: Colors.green[600],
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CriarEvento2()),
                    );
                  },
                ),
                shape: BadgeShape.square,
                borderRadius: 50,
              ),
            ],
          ),
        ],
      ),
    ];
  }

  showAlertDialog2(BuildContext context) {
    Widget cancelaButton = FlatButton(
      child: Text(
        "Cancelar",
        style: TextStyle(
          color: Colors.blueGrey[200],
        ),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continuaButton = FlatButton(
      child: Text(
        "Salvar",
        style: TextStyle(
          color: Colors.green[200],
        ),
      ),
      onPressed: () {
        //_increment();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      },
    );
    //configura o AlertDialog
    AlertDialog alert = AlertDialog(
        backgroundColor: Colors.black45,
        title: Text(
          "Localização ",
          style: TextStyle(
            color: Colors.yellow[600],
          ),
        ),
        content: PopupMenuButton<WhyFarther>(
          child: ListTile(
            trailing: Icon(
              Icons.arrow_drop_down,
              color: Colors.grey[200],
            ),
            title: Text(
              'Dados da sua Localização',
              style: TextStyle(color: Colors.grey[200]),
            ),
          ),
          onSelected: (WhyFarther result) {
            setState(() {
              var selection = result;
            });
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFarther>>[
            //const PopupMenuItem(child: Text("Dados da sua Localização")),
            const PopupMenuItem(child: ListTile(
              title: Text("Localizar no Mapa"),
              trailing: Icon(
                Icons.map,
                color: Colors.blueGrey,
              ),
            )),
            const PopupMenuItem(child: ListTile(
              title: Text("Ponto de Referência"),
              trailing: Icon(
                Icons.info_outline,
                color: Colors.blueGrey
              ),
            )),
          ],
        ));
    //exibe o diálogo
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> formularioRegistro() {
      return [
        Container(
          child: Card(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(
                    Icons.event_note,
                    color: Colors.blueGrey,
                  ),
                  title: Text(
                    'Crie seu evento e chama a galera',
                    style: TextStyle(
                      color: Colors.blueGrey,
                    ),
                  ),
                  subtitle: Text(
                    'Abaixo coloque as informações do evento que você deseja criar.',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                new Container(
                    padding: const EdgeInsets.all(16.0),
                    child: new Form(
                        //key: formKey,
                        child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: usernameAndPassword(),
                    ))),
                new Container(
                    padding: const EdgeInsets.all(16.0),
                    child: new Form(
                        // key: formKey,
                        child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      //children: submitWidgets(),
                    ))),
              ],
            ),
          ),
        ),
      ];
    }

    return Scaffold(
        appBar: new AppBar(
            title: const Text('Criar Evento'),
            backgroundColor: Colors.black,
            // title: const Text(''),
            actions: <Widget>[
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
        body: Container(
          color: Colors.black,
          child: new ListView(
            children: <Widget>[
              Column(
                children: [
                  new Card(
                    color: Colors.yellow[600],
                    child: new Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Container(
                            padding: const EdgeInsets.all(16.0),
                            child: new Form(
                              //key: formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                              ),
                            ),
                          ),
                          new Container(
                            padding: const EdgeInsets.all(16.0),
                            child: new Form(
                              //key: formKey,
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: formularioRegistro(),
                              ),
                            ),
                          ),
                        ]),
                  ),
                  //hintText()
                ],
              ),
            ],
          ),
        ));
  }
}
