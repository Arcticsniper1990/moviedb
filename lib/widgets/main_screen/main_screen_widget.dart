import 'package:flutter/material.dart';

import '../movie_list/movie_list_widget.dart';


class MainScreenWidget extends StatefulWidget {


  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('1'),),
    body: IndexedStack(
      index: _selectedIndex,
      children: [
        Text(
          'Index 0: Home',
          style: optionStyle,
        ),
        MovieListWidget(),
        Text(
          'Index 2: School',
          style: optionStyle,
        ),
    ],),
    bottomNavigationBar: BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
        icon: Icon(Icons.home),
    label: 'Новости',
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.movie_creation_outlined),
    label: 'Фильмы',
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.tv),
    label: 'Сериалы',
    ),
    ],
    currentIndex: _selectedIndex,
    selectedItemColor: Colors.amber[800],
    onTap: _onItemTapped,
    ),
    );
  }
}
