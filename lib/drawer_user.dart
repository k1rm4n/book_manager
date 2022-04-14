import 'package:flutter/material.dart';

class MainCustomDrawer extends StatefulWidget {
  @override
  _CustomDrawer createState() => _CustomDrawer();
}

class _CustomDrawer extends State<MainCustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          ListTile(
            title: Text('Поле 1'),
          ),
        ],
      ),
    );
  }
}
