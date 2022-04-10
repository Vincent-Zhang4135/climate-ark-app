import 'package:flutter/material.dart';
import 'package:canvas/views/home_page.dart';
import 'package:canvas/views/login_page.dart';
import 'package:canvas/components/action_page/graph_image.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const CircleAvatar(
        radius: 20.0,
        backgroundImage: AssetImage('assets/dummy.png'),
      ),
      margin: const EdgeInsets.all(10.0),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    LoginPage(),
    HomePage(),
    Text(
      'Action',
      style: optionStyle,
    ),
    GraphCard()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const ProfilePic(),
        title: const Text(
          'J A N U S',
          style: TextStyle(
            color: Color(0xff62cfb2),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xff08b184),
        // shape: const RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(
        //     bottom: Radius.elliptical(15, 10),
        //   ),
        // ),
        centerTitle: true,
        // bottom: PreferredSize(
        //   child: Container(
        //     height: 30.0,
        //     decoration: const BoxDecoration(
        //       borderRadius: BorderRadius.only(
        //         bottomLeft: Radius.elliptical(15, 10),
        //         bottomRight: Radius.elliptical(15, 10),
        //       ),
        //       color: Colors.orange,
        //     ),
        //   ),
        //   preferredSize: const Size.fromHeight(30.0),
        // ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Login',
            backgroundColor: Color(0xff08b184),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color(0xff08b184),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Action',
            backgroundColor: Color(0xff08b184),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph),
            label: 'Impact',
            backgroundColor: Color(0xff08b184),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff012019),
        onTap: _onItemTapped,
      ),
    );
  }
}
