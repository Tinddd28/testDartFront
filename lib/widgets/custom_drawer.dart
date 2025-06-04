import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text("Главная"),
            onTap: () => Navigator.pushNamed(context, '/home'),
          ),
          ListTile(
            title: Text("Запущенные приложения"),
            onTap: () => Navigator.pushNamed(context, '/applications'),
          ),
          ListTile(
            title: Text("Файловая активность"),
            onTap: () => Navigator.pushNamed(context, '/file-activities'),
          ),
          ListTile(
            title: Text("Сетевая активность"),
            onTap: () => Navigator.pushNamed(context, '/network-activities'),
          ),
        ],
      ),
    );
  }
}