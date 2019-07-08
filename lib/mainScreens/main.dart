import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:go_together/config.dart' as config;
import 'package:go_together/mainScreens/pages/search.dart';
import 'package:go_together/mainScreens/pages/chat.dart';
import 'package:go_together/mainScreens/pages/home.dart';
import 'package:go_together/mainScreens/pages/events.dart';
import 'package:go_together/mainScreens/pages/profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentTabIndex = 2;

  _logOut() async {
    final url = config.getUrl() + "api/tokens";
    try {
      var response = await http
          .delete(url, headers: {'Authorization': 'Bearer ' + 'token'});

      return response.statusCode;
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      Center(child: ChatPage()),
      Center(child: SearchPage()),
      Center(child: HomePage()),
      Center(child: EventsPage()),
      Center(child: ProfilePage()),
    ];

    final _kBottomNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.comments, color: Colors.purple),
          title: Text('Чат')),
      BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.search, color: Colors.purple),
          title: Text('Поиск')),
      BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.home, color: Colors.purple),
          title: Text('Главная')),
      BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.heart, color: Colors.purple),
          title: Text('События')),
      BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.userAlt, color: Colors.purple),
          title: Text('Профиль')),
    ];
    assert(_kTabPages.length == _kBottomNavBarItems.length);
    var bottomNavBar = BottomNavigationBar(
      items: _kBottomNavBarItems,
      currentIndex: currentTabIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          currentTabIndex = index;
        });
      },
    );
    return Scaffold(
      body: _kTabPages[currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}
