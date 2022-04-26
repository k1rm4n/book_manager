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
      password: 'pOQ7gO',
      db: 'krotov_bm_db',
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
            Provider.of<DataText>(context, listen: false).setPassText('Пароль');
            Provider.of<DataText>(context, listen: false).setDefaultTextStyle();
            Provider.of<DataText>(context, listen: false).setDefColorBorder();
            Provider.of<DataText>(context, listen: false).setNameUser('Крот');
            Navigator.popAndPushNamed(context, '/profile');
          } else {
            Provider.of<DataText>(context, listen: false).setText('E-mail*');
            Provider.of<DataText>(context, listen: false)
                .setPassText('Пароль*');
            Provider.of<DataText>(context, listen: false).setErorTextStyle();
            Provider.of<DataText>(context, listen: false).setRedColorBorder();
          }
          conn.close();
        },
      );
    });
  }
}
