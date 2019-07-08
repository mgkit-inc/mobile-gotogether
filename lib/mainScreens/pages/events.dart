import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  int groupValue = 1;
  String name = 'Мероприятие';
  String date = 'Дата и время';
  Color circle = Colors.transparent;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        leading: Icon(Icons.adb, color: Colors.purple),
        title: Text('События', style: TextStyle(color: Colors.purple, fontFamily: "Nexa")),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Radio(value: 1, groupValue: groupValue, onChanged: (int e) => something(e), activeColor: Colors.lightGreen),
                    Text('Мои'),
                  ],
                ),
                SizedBox(width: 20.0),
                Column(
                  children: <Widget>[
                    Radio(value: 2, groupValue: groupValue, onChanged: (int e) => something(e), activeColor: Colors.lightGreen),
                    Text('Подписки'),
                  ],
                ),
                SizedBox(width: 20.0),
                Column(
                  children: <Widget>[
                    Radio(value: 3, groupValue: groupValue, onChanged: (int e) => something(e), activeColor: Colors.lightGreen),
                    Text('Избранное'),
                  ],
                ),
              ],
            ),
            Container(
              child: Column(
                children: <Widget>[
                  ListTile( // TODO: Переделать в listview с билдером
                    leading: CircleAvatar(
                      backgroundColor: circle, // TODO: В последствии заменить на backgroundImage
                    ),
                    title: Text(name),
                    subtitle: Text(date),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void something(int e){
    setState(() {
      if(e == 1){
        groupValue = 1;
        name = 'Моё мероприятие';
        date = 'Дата моего мероприятия';
        circle = Colors.deepOrangeAccent;
      } else if (e == 2) {
        groupValue = 2;
        name = 'Мероприятие куда меня позвали';
        date = 'Дата этого мероприятия';
        circle = Colors.pink;
      } else if (e == 3){
        groupValue = 3;
        name = 'Избранное мероприятие';
        date = 'Дата этого мероприятия';
        circle = Colors.yellowAccent;
      }
    });
  }
}
