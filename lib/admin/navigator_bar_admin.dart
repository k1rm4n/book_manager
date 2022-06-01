import 'package:book_manager/admin/library_admin.dart';
import 'package:book_manager/admin/query_admin.dart';
import 'package:book_manager/admin/readers_admin.dart';
import 'package:book_manager/admin/welcom_query.dart';
import 'package:flutter/material.dart';

class NavigatorBarAdmin extends StatefulWidget {
  @override
  _NavigatorBarAdminState createState() => _NavigatorBarAdminState();
}

class _NavigatorBarAdminState extends State<NavigatorBarAdmin> {
  int _selectedIndex = 2;
  final List _children = [
    QueryAdmin(),
    LibraryAdmin(),
    ReadersAdmin(),
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
                label: 'Запросы',
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
                icon: Icon(Icons.person_pin_rounded),
                label: 'Читатели',
                activeIcon: GradientIcon(
                  icon: Icon(Icons.person_pin_rounded),
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
