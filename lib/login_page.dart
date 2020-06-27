import 'package:flutter/material.dart';
import 'package:localizeja/primary_button.dart';
import 'auth.dart';
import 'package:flutter/services.dart' ;
import 'package:badges/badges.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title, this.auth, this.onSignIn}) : super(key: key);

  final String title;
  final BaseAuth auth;
  final VoidCallback onSignIn;

  @override
  _LoginPageState createState() => new _LoginPageState();
}

enum FormType {
  login,
  register
}

class _LoginPageState extends State<LoginPage> {
  static final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  FormType _formType = FormType.login;
  String _authHint = '';

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
  
  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        String userId = _formType == FormType.login
            ? await widget.auth.signIn(_email, _password)
            : await widget.auth.createUser(_email, _password);
        setState(() {
          _authHint = 'Signed In\n\nUser id: $userId';
        });
        widget.onSignIn();
      }
      catch (e) {
        setState(() {
          _authHint = 'Sign In Error\n\n${e.toString()}';
        });
        print(e);
      }
    } else {
      setState(() {
        _authHint = '';
      });
    }
  }

  void moveToRegister() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
      _authHint = '';
    });
  }

  void moveToLogin() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
      _authHint = '';
    });
  }

  List<Widget> usernameAndPassword() {
    return [
      padded(child: new TextFormField(
        key: new Key('email'),
        cursorColor: Colors.white , 
        style: TextStyle(
          color: Colors.white
        ),
        decoration: new InputDecoration(labelText: 'Email: ',
        focusColor: Colors.white,    
        hintStyle: TextStyle (  
          color: Colors.white,
    
        ),
        labelStyle: TextStyle(
          color:Colors.white,
          decorationColor: Colors.white,
          //fontStyle: FontStyle.italic
        ),
        ),
        autocorrect: false,
        validator: (val) => val.isEmpty ? 'Email can\'t be empty.' : null,
        onSaved: (val) => _email = val,
      )),
      padded(child: new TextFormField(
        key: new Key('password'),
        cursorColor: Colors.white , 
        style: TextStyle(
          color: Colors.white

        ),
        decoration: new InputDecoration(labelText: 'Senha: ',
        hintStyle: TextStyle (  
          color: Colors.white
        ),
        labelStyle: TextStyle(
          color:Colors.white,
          decorationColor: Colors.white,
          //fontStyle: FontStyle.italic
        ),
        
        ),
        obscureText: true,
        autocorrect: false,
        validator: (val) => val.isEmpty ? 'Password can\'t be empty.' : null,
        onSaved: (val) => _password = val,
      )),
    ];
  }

  List<Widget> submitWidgets() {
    switch (_formType) {
      case FormType.login:
        return [
          new PrimaryButton(
            key: new Key('login'),
            text: 'Login',
            height: 44.0,
            onPressed: validateAndSubmit
          ),
          new FlatButton(
            key: new Key('need-account'),
            child: new Text("Precisa de uma conta? Registro",
            style: TextStyle(
              color:Colors.grey
            ),
            ),
            onPressed: moveToRegister
          ),
        ];
      case FormType.register:
        return [
          new PrimaryButton(
            key: new Key('register'),
            text: 'Criar conta',
            height: 44.0,
            onPressed: validateAndSubmit
          ),
          new FlatButton(
            key: new Key('need-login'),
            child: new Text("Já tem uma conta ? Realize o login",
            style: TextStyle(
              color:Colors.grey
            ),
            ),
            onPressed: moveToLogin
          ),
        ];
    }
    return null;
  }

  Widget hintText() {
    return new Container(
        height: 100.0,
        padding: const EdgeInsets.all(32.0),
        child: new Text(
            _authHint,
            key: new Key('hint'),
            style: new TextStyle(fontSize: 18.0, color: Colors.grey),
            textAlign: TextAlign.center)
    );
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
    ]);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title,
        style: TextStyle(
          color:Colors.white
        ),
        ),
        backgroundColor: Colors.black,
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                          child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                             Badge(
                               
                                badgeColor: Colors.black,
                                badgeContent: Icon(
                                  Icons.eject,
                                  size: 28,
                                  color: Colors.white,
                                ),
                                shape: BadgeShape.square,
                                borderRadius: 20,
      
                                ),
                          
                          ],
                        ),
                       onPressed: () {
                        // _settingModalBottomSheet(context);
                       }),
            ],
            
            )
            ),
      backgroundColor: Colors.grey[200],
      body: new SingleChildScrollView(child: new Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("imagens.dart/Untitled2.png"), fit: BoxFit.cover)),
        padding: const EdgeInsets.all(16.0),
        child: new Column(
          children: [
            SizedBox(
              height: 50,
            ),
            new Card(
              color: Colors.black38,
              child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                      leading: Icon(Icons.explore,
                      color: Colors.white,
                      ),
                      title: Text('LocalizeJA',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color:Colors.grey,
                        fontSize: 22,
                        fontWeight:  FontWeight.bold,
                  
                      ),
                      ),
                      subtitle: Text('Marque com seus amigos aquele rolê top com churrascos, eventos e festas.',
                      style: TextStyle(
                        color: Colors.white,
                        //fontWeight:  FontWeight.bold,

                      ),
                      ),
                ),
                new Container(
                  
                    padding: const EdgeInsets.all(16.0),
                    child: new Form(
                        key: formKey,
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: usernameAndPassword() + submitWidgets(),
                        )
                    )
                ),
              ])
            ),
            hintText()
          ]
        )
      )),
      
      
    );
  }

  Widget padded({Widget child}) {
    return new Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: child,
    );
  }
}

