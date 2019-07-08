import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: Colors.purple,),
                  labelText: 'Поиск',
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    // TODO: результаты поиска
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}