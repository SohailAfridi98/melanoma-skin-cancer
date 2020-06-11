import 'package:deyegnose/pages/statistics.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/core.dart';


import 'history.dart';
import 'home.dart';
import 'package:dcdg/dcdg.dart';

void main(){ 
	SyncfusionLicense.registerLicense("NT8mJyc2IWhiZH1nfWN9Z2NoYmF8YGJ8ampqanNiYmlmamlmanMDHmgyNSE6Nzp9IDI3NjYifT4TND4yOj99MDw"); 
	return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String _value;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dEYEgnose',
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _currentIndex = 0;
  List _listPages = List();
  Widget _currentPage;
  @override
  void initState() {
    super.initState();
    _listPages..add(Home())..add(StatisticsScreen())..add(History());
    _currentPage = Home();
  }

  void _changePage(int selectedIndex) {
    setState(() {
      _currentIndex = selectedIndex;
      _currentPage = _listPages[selectedIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dEYEgnose'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: _currentPage,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart),
            title: Text('Statistics'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text('History'),
          ),
        ],
        onTap: (selectedIndex) => _changePage(selectedIndex),
      ),
    );
  }
}
