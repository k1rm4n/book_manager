import 'package:book_manager/elect_list.dart';
import 'package:book_manager/library_list.dart';
import 'package:book_manager/profile_user.dart';
import 'package:book_manager/query_user.dart';
import 'package:flutter/material.dart';

class MainNavigationBar extends StatefulWidget {
  @override
  _CustomNavigationBar createState() => _CustomNavigationBar();
}

class _CustomNavigationBar extends State<MainNavigationBar> {
  int _selectedIndex = 3;
  final List _children = [
    MyQuery(),
    Library(),
    Elect(),
    Profile(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndex],
      bottomNavigationBar: Container(
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
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.email_outlined,
                ),
                label: 'Мои запросы',
                activeIcon: GradientIcon(
                  icon: Icon(Icons.email_outlined),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.auto_awesome_motion_rounded,
                ),
                label: 'Библиотека',
                activeIcon: GradientIcon(
                  icon: Icon(Icons.auto_awesome_motion_rounded),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline),
                label: 'Избранные',
                activeIcon: GradientIcon(
                  icon: Icon(Icons.favorite_outline),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'Профиль',
                activeIcon: GradientIcon(
                  icon: Icon(Icons.person),
                ),
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            unselectedItemColor: const Color.fromRGBO(124, 124, 124, 1),
            selectedItemColor: const Color.fromRGBO(61, 104, 255, 1),
          ),
        ),
      ),
    );
  }
}

class GradientIcon extends StatelessWidget {
  const GradientIcon({required this.icon});
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => const LinearGradient(
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
        colors: [
          Color.fromRGBO(76, 61, 255, 1),
          Color.fromRGBO(103, 152, 230, 1),
        ],
      ).createShader(bounds),
      child: icon,
    );
  }
}
