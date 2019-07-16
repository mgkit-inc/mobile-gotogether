import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_together/widgets/appBar.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _userPasswordController = TextEditingController();
  final TextEditingController _userEmailController = TextEditingController();
  final TextEditingController _userPassword2Controller = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myApp(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Пожалуйста введите имя пользователя';
                    }
                    return 'Всё заполнено';
                  },
                  controller: _userNameController,
                  decoration: InputDecoration(
                    labelText: 'Имя пользователя',
                  ),
                  keyboardType: TextInputType.text,
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Пожалуйста введите email';
                    }
                    return 'Всё заполнено';
                  },
                  controller: _userEmailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty && value.length <= 8) {
                      return 'Пожалуйста введите пароль';
                    }
                    return 'Всё заполнено';
                  },
                  obscureText: true,
                  controller: _userPasswordController,
                  decoration: InputDecoration(
                    labelText: 'Пароль',
                  ),
                  keyboardType: TextInputType.text,
                ),
                TextFormField(
                  validator: (value) {
                    if (_userPasswordController.text != value) {
                      return 'Пожалуйста повторите пароль';
                    }
                    return 'Всё заполнено';
                  },
                  obscureText: true,
                  controller: _userPassword2Controller,
                  decoration: InputDecoration(
                    labelText: 'Повторите пароль',
                  ),
                  keyboardType: TextInputType.text,
                ),
                MaterialButton(
                    height: 45.0,
                    minWidth: 100.0,
                    textColor: Colors.white,
                    color: Colors.purple,
                    shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                    onPressed: () {
                      // Отправка данных на сервер и при получении 200
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 150.0,
                      child: Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.signInAlt,
                              color: Colors.white),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text('Зарегестрироваться'),
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

