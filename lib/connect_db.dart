import 'package:mysql1/mysql1.dart';
import 'package:flutter/material.dart';

class MyConnection {
  Future<MySqlConnection> getConnection() async {
    var settings = ConnectionSettings(
      host: 'mysql.gameoxford.ru',
      port: 3306,
      user: 'krotov',
      password: '2V5xK@t!a',
      db: 'krotov',
    );
    return await MySqlConnection.connect(settings);
  }

  void init(final controller) async {
    await getConnection().then((conn) {
      conn.query('select * from users').then(
        (results) {
          for (var row in results) {
            if (row[1] == controller) {
              print('Такой пользователь есть!');
            } else
              print('Такого пользователя нет');
          }
          conn.close();
        },
      );
    });
  }
}
