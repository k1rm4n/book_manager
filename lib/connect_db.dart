import 'package:mysql1/mysql1.dart';
import 'package:flutter/material.dart';
import 'auto_user.dart';

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

  bool auto(String mail, String pass) {
    bool state = true;
    getConnection().then((conn) {
      conn.query('select * from users').then(
        (results) {
          for (var row in results) {
            if (row[1] == mail && row[2] == pass) {
              state = true;
            } else {
              state = false;
            }
          }
          conn.close();
        },
      );
    });
    return state;
  }
}
