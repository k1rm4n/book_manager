import 'package:mysql1/mysql1.dart';
import 'package:flutter/material.dart';
import 'auto_user.dart';
import 'data.dart';
import 'package:provider/provider.dart';

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

  void auto(String mail, String pass, BuildContext context) async {
    getConnection().then((conn) {
      conn
          .query(
              'select * from users where login = "$mail" and pass = "$pass" ')
          .then(
        (results) {
          if (results.isNotEmpty) {
            Provider.of<DataText>(context, listen: false).setText('E-mail');
            Provider.of<DataText>(context, listen: false).setDefaultTextStyle();
          } else {
            Provider.of<DataText>(context, listen: false).setText('E-mail*');
            Provider.of<DataText>(context, listen: false).setErorTextStyle();
          }
          conn.close();
        },
      );
    });
  }
}
