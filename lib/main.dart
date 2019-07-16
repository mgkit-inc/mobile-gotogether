import 'dart:convert';

import 'package:flutter/material.dart';
import 'config.dart' as config;
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'mainScreens/main.dart';
import 'mainScreens/recover.dart';
import 'mainScreens/registration.dart';
import 'package:go_together/widgets/appBar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      theme: ThemeData(primarySwatch: Colors.purple),
      routes: {
        '/login': (BuildContext context) => LoginPage(),
        '/reg': (BuildContext context) => RegistrationPage(),
        '/main': (BuildContext context) => MainPage(),
        '/recovery': (BuildContext context) => RecoveryPage(),
      },
    );
  }
}

Future<void> _neverSatisfied(title, message) async {
  var context;
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('$title'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('$message'),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  _singIn() async {
    String basicAuth = 'Basic ' +
        base64Encode(utf8
            .encode('${_userNameController.text}:${_passwordController.text}'));
    String url = config.getUrl() + "api/tokens";
    try {
      var response = await http.post(url,
          headers: {'Accept': 'application/json', 'authorization': basicAuth});
      if (response.statusCode == 200) {
        return response.body;
      } else if (response.statusCode == 401)
        return _neverSatisfied('Ошибка', 'Неправельные логин или пароль');
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myApp(),
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(FontAwesomeIcons.userCircle, color: Colors.purple, size: 90),
              Form(
                  child: Container(
                key: _formKey,
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Пожалуйста введите имя пользователя';
                        }
                      },
                      controller: _userNameController,
                      decoration: InputDecoration(
                        icon: Icon(FontAwesomeIcons.userAlt),
                        labelText: 'Имя пользователя',
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Пожалуйста введите пароль';
                        }
                      },
                      controller: _passwordController,
                      decoration: new InputDecoration(
                        icon: Icon(FontAwesomeIcons.key),
                        labelText: 'Пароль',
                      ),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 35.0),
                    ),
                    MaterialButton(
                        height: 45.0,
                        minWidth: 100.0,
                        textColor: Colors.white,
                        color: Colors.purple,
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        onPressed: () {
                          Navigator.pushNamed(context, '/main');

//                          if (_formKey.currentState.validate()) {
//                            // Вход в приложение
//                          }
                        },
                        child: Container(
                          width: 100.0,
                          child: Row(
                            children: <Widget>[
                              Icon(FontAwesomeIcons.signInAlt,
                                  color: Colors.white),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text('Войти'),
                              )
                            ],
                          ),
                        )),
                    MaterialButton(
                        height: 45.0,
                        minWidth: 100.0,
                        textColor: Colors.white,
                        color: Colors.purple,
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        onPressed: () {
                          // Переход на регистрацию
                          Navigator.pushNamed(context, '/reg');
                        },
                        child: Container(
                          width: 150.0,
                          child: Row(
                            children: <Widget>[
                              Icon(FontAwesomeIcons.signInAlt,
                                  color: Colors.white),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text('Регистрация'),
                              )
                            ],
                          ),
                        )),
                    MaterialButton(
                      textColor: Colors.black12,
                      child: Text('Забыли пароль?'),
                      onPressed: () {
                        // Восстановление пароля
                        Navigator.pushNamed(context, '/recovery');
                      },
                    )
                  ],
                ),
              )),
            ],
          ),
        ],
      ),
    );
  }
}
