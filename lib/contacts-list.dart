  
import 'dart:math';

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter/services.dart';


class ListaDeContatos extends StatefulWidget {
  ListaDeContatos({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListaDeContatosState createState() => _ListaDeContatosState();
}

class _ListaDeContatosState extends State<ListaDeContatos> {
  List<Contact> contacts = [];
  List<Contact> contactsFiltered = [];
  Map<String, Color> contactsColorMap = new Map();
  TextEditingController searchController = new TextEditingController();
  String dropdownValue = 'P';
  

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

    void _barraDePEsquisa(context) {
      ExpansionTile(
              title: Text(
                "Title",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              children: <Widget>[
                ExpansionTile(
                  title: Text(
                    'Sub title',
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text('data'),
                    )
                  ],
                ),
                ListTile(
                  title: Text(
                    'data'
                  ),
                )
              ],
            );
    }

  @override
  void initState() {
    super.initState();
    getAllContacts();
    searchController.addListener(() {
      filterContacts();
    });
  }

  String flattenPhoneNumber(String phoneStr) {
    return phoneStr.replaceAllMapped(RegExp(r'^(\+)|\D'), (Match m) {
      return m[0] == "+" ? "+" : "";
    });
  }

  getAllContacts() async {
    List colors = [
      //Colors.green,
      Colors.deepPurple,
      Colors.orange,
      Colors.yellow
    ];
    int colorIndex = 0;
    List<Contact> _contacts = (await ContactsService.getContacts()).toList();
    _contacts.forEach((contact) {
      Color baseColor = colors[colorIndex];
      contactsColorMap[contact.displayName] = baseColor;
      colorIndex++;
      if (colorIndex == colors.length) {
        colorIndex = 0;
      }
    });
    setState(() {
      contacts = _contacts;
    });
  }

  filterContacts() {
    List<Contact> _contacts = [];
    _contacts.addAll(contacts);
    if (searchController.text.isNotEmpty) {
      _contacts.retainWhere((contact) {
        String searchTerm = searchController.text.toLowerCase();
        String searchTermFlatten = flattenPhoneNumber(searchTerm);
        String contactName = contact.displayName.toLowerCase();
        bool nameMatches = contactName.contains(searchTerm);
        if (nameMatches == true) {
          return true;
        }

        if (searchTermFlatten.isEmpty) {
          return false;
        }

        var phone = contact.phones.firstWhere((phn) {
          String phnFlattened = flattenPhoneNumber(phn.value);
          return phnFlattened.contains(searchTermFlatten);
        }, orElse: () => null);

        return phone != null;
      });

      setState(() {
        contactsFiltered = _contacts;
      });
      
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isSearching = searchController.text.isNotEmpty;
    return Scaffold(
      appBar: new AppBar(

          backgroundColor: Colors.black,
           title: const Text('Convites'),
           
          actions: <Widget>[
            DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.search),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.black),
              underline: Container(
                height: 2,
                color: Colors.yellow,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>['P']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: TextField(
                    
                    controller: searchController,
                    decoration: InputDecoration(
                      labelText: 'Pesquisar',
                      labelStyle: TextStyle(
                        color: Colors.yellow[50]
                      ),
                      border: new OutlineInputBorder(
                        borderSide: new BorderSide(
                          color: Theme.of(context).primaryColor
                        )
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.yellow[50]
                      )
                    ),
                    
                  ),
                );
              }).toList(),
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
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            
            Expanded(
              child: ListView.builder(

                shrinkWrap: true,
                itemCount: isSearching == true ? contactsFiltered.length : contacts.length,
                itemBuilder: (context, index) {
                  Contact contact = isSearching == true ? contactsFiltered[index] : contacts[index];
                  var _numeroContato = contact.phones.elementAt(0).value = 'Número Inexistente';

                  if(index == 0){
                    
                  }
                  var baseColor = contactsColorMap[contact.displayName] as dynamic;
                  //var contactPhone = contact.phones.elementAt(0).value;
                  bool _value1 = false;
                  void _value1Changed(bool value) => setState(() => _value1 = value);
                  

                  Color color1 = baseColor[800];
                  Color color2 = baseColor[400];
                  
                  return ListTile(
                    title: Text(contact.displayName),
                    subtitle: Text(
                      contact.phones.elementAt(0).value == null ? _numeroContato : contact.phones.elementAt(0).value ,
                      
                    ),
                    
                    leading: (contact.avatar != null && contact.avatar.length > 0) ?
                      CircleAvatar(
                        backgroundImage: MemoryImage(contact.avatar),
                      ) : 
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                            colors: [
                              color1,
                              color2,
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight
                          )
                        ),
                        child: CircleAvatar(
                          backgroundImage: (
                                 AssetImage("imagens.dart/Untitled3.png")
                          ),
                          backgroundColor: Colors.blueGrey,

                        )
                      ),
                      trailing: 
                        Checkbox(value: _value1, onChanged: _value1Changed)
                  
                    );
                  
                },
                
              ),
            )
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
    
  }
}