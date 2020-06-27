import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:localizeja/home_page.dart';
import 'package:localizeja/criar_evento2.dart';

class CriarEvento extends StatefulWidget {
  @override
  _CriarEventoState createState() => _CriarEventoState();
}

class _CriarEventoState extends State<CriarEvento> {
  String _value = '';
  bool _value1 = false;
  bool _value2 = false;

  //we omitted the brackets '{}' and are using fat arrow '=>' instead, this is dart syntax
  void _value1Changed(bool value) => setState(() => _value1 = value);
  void _value2Changed(bool value) => setState(() => _value2 = value);

 

  List<Widget> usernameAndPassword() {
    return [
      
      new CheckboxListTile(
        value: _value1,
        onChanged: _value1Changed,
        title: new Text('Privado'),
        controlAffinity: ListTileControlAffinity.leading,
        subtitle: new Text('Apenas para o seus amigos'),
        secondary: new Icon(Icons.visibility_off,
        color: Colors.blueGrey,
        ),
        activeColor: Colors.red,
      ),
      SizedBox(
        height: 5,
      ),
      new CheckboxListTile(
        value: _value2,
        onChanged: _value2Changed,
        title: new Text('Público'),
        controlAffinity: ListTileControlAffinity.leading,
        subtitle: new Text('Eventos públicos ficara visivel para toda a sua cidade'),
        secondary: new Icon(Icons.visibility,
        color: Colors.blueGrey,
        ),
        activeColor: Colors.green,
      ),
      new TextFormField(
        key: new Key('nome'),
        style: TextStyle(
          color: Colors.black,
        ),
        decoration: new InputDecoration(
          labelText: 'Nome do Evento: ',
          labelStyle: TextStyle(
            color: Colors.blueGrey,
            fontSize: 16,
          ),
        ),
        autocorrect: false,
        // validator: (val) => val.isEmpty ? _kTestValue : null,
        onChanged: (String value) {
          //setState(() {
          // _nome = value;
          //});
        },
        //onSaved: (val) => _email = val,
      ),
      
      new TextFormField(
        key: new Key('descricao'),
        style: TextStyle(
          color: Colors.black,
        ),
        decoration: new InputDecoration(
          labelText: 'Descricao do Evento: ',
          labelStyle: TextStyle(
            color: Colors.blueGrey,
            fontSize: 16,
          ),
        ),
        obscureText: false,
        autocorrect: false,
        // validator: (val) => val.isEmpty ? _kTestValue : null,
        onChanged: (String value) {
          // setState(() {
          // _descricao = value;
          // });
        }, // onSaved: (val) => _password = val,
      ),
      new Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Badge(
            badgeColor: Colors.white,
            badgeContent: IconButton(
              icon: Icon(Icons.arrow_forward,
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
      backgroundColor: Colors.blueGrey[900],
      title: Text(
        "Salvar Registro",
        style: TextStyle(
          color: Colors.orange,
        ),
      ),
      content: Text(
        "Deseja mesmo salvar esse registro ?",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
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
