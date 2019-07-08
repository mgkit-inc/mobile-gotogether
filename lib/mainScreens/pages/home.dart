import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        leading: Icon(FontAwesomeIcons.cog, color: Colors.purple),
        backgroundColor: Colors.transparent,
        title: Text('Главная', style: TextStyle(color: Colors.purple, fontFamily: "Nexa"),),
      ),
      body: Container(
        child: GridView.count(
            crossAxisCount: 3, // TODO: сделать настройки для выбора сетки для юзера
            scrollDirection: Axis.vertical,
          children: List.generate(50, (index){
            return Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: .5), // TODO: убрать бордер, когда забивать данными буду
                ),
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.map, color: Colors.black, size: 100.0,), // TODO: картинки сюда от мероприятия место иконок
                    Text('Название мероприятия', style: TextStyle(color: Colors.purple)),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
