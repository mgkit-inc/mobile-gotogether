import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Профиль',
            style: TextStyle(color: Colors.purple, fontFamily: "Nexa")),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.signOutAlt, color: Colors.purple),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: <Widget>[
          IconButton(
              tooltip: 'Настройки',
              icon: Icon(FontAwesomeIcons.cog, color: Colors.purple),
              onPressed: () {
                // Навигатор на настройки
              }),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.purple.withOpacity(.5),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 150.0,
                        height: 150.0,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ClipOval(
                            clipper: MClipper(),
                            child: Icon(
                              FontAwesomeIcons.userCircle,
                              color: Colors.black12,
                              size: 120.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Text('Петров Василий',
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 20.0,
                        fontFamily: 'Nexa')),
              ],
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Text('Подписки'),
                    Container(
                      child: Column(
                        children: <Widget>[
                          ListTile( // TODO: Переделать в listview с билдером
                            leading: CircleAvatar(
                              backgroundColor: Colors
                                  .purple, // TODO: В последствии заменить на backgroundImage
                            ),
                            title: Text('Название мероприятия'),
                            subtitle: Text('Дата и время мероприятия'),
                            onTap: () {
                              // Открытие мероприятия в другом окне
                            },
                            trailing: IconButton( // TODO: Запихнуть это в row и добавить количество людей на мероприятии
                                icon: Icon(FontAwesomeIcons.star,
                                    color: Colors.lime),
                                onPressed: () {
                                  // Добавление в избранное
                                }),
                          ),
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.pink, // В последствии заменить на backgroundImage
                            ),
                            title: Text('Название мероприятия'),
                            subtitle: Text('Дата и время мероприятия'),
                            onTap: () {
                              // Открытие мероприятия в другом окне
                            },
                            trailing: IconButton(
                                icon: Icon(FontAwesomeIcons.star,
                                    color: Colors.lime),
                                onPressed: () {
                                  // Добавление в избранное
                                }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: min(size.width, size.height) / 2);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
