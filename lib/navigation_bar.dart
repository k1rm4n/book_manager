import 'package:flutter/material.dart';

class MainNavigationBar extends StatefulWidget {
  @override
  _CustomNavigationBar createState() => _CustomNavigationBar();
}

class _CustomNavigationBar extends State<MainNavigationBar> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            offset: Offset(0, -1),
            blurRadius: 8,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        child: BottomNavigationBar(
          backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.email_outlined,
              ),
              label: 'Мои запросы',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.auto_awesome_motion_rounded,
                ),
                label: 'Библиотека'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline), label: 'Избранные'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'Профиль'),
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: const Color.fromRGBO(124, 124, 124, 1),
          selectedItemColor: const Color.fromRGBO(61, 104, 255, 1),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
