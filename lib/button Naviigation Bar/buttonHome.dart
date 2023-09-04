import 'package:flutter/material.dart';

import '../screens/all_transaction.dart';
import '../screens/home_screen.dart';
import 'package:super_bottom_navigation_bar/super_bottom_navigation_bar.dart';



class ButtomHome extends StatefulWidget {
  @override
  _ButtomHomeState createState() => _ButtomHomeState();
}

class _ButtomHomeState extends State<ButtomHome> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Home_Screen(),
    const Transaction_Screen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _pages[_currentIndex],

      bottomNavigationBar: Container(
        height: 100,
        child: BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          backgroundColor: Color(0XFF012d63),
          //type: BottomNavigationBarType.shifting,
          showSelectedLabels: true,
          showUnselectedLabels: true,

          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items:  const [
            BottomNavigationBarItem(

              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.credit_card),

              label: 'Transaction',
            ),
          ],
        ),
      ),
    );
  }
}

