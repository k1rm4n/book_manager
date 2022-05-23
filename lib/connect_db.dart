import 'package:mysql1/mysql1.dart';
import 'package:flutter/material.dart';
import 'data/auto_data.dart';
import 'package:provider/provider.dart';
import 'data/profile_data.dart';

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
    String getFirstAndLastName(var lastname, var firstname) {
      return "$lastname $firstname";
    }

    getConnection().then((conn) {
      conn
          .query(
              'select * from users where login = "$mail" and pass = "$pass" ')
          .then(
        (results) {
          if (results.isNotEmpty) {
            Provider.of<AutoData>(context, listen: false).setText('E-mail');
            Provider.of<AutoData>(context, listen: false).setPassText('Пароль');
            Provider.of<AutoData>(context, listen: false).setDefaultTextStyle();
            Provider.of<AutoData>(context, listen: false).setDefColorBorder();
            Navigator.popAndPushNamed(context, '/navBar',
                arguments: getFirstAndLastName(
                    results.first["lastname"], results.first["firstname"]));
          } else {
            Provider.of<AutoData>(context, listen: false).setText('E-mail*');
            Provider.of<AutoData>(context, listen: false)
                .setPassText('Пароль*');
            Provider.of<AutoData>(context, listen: false).setErorTextStyle();
            Provider.of<AutoData>(context, listen: false).setRedColorBorder();
          }
          conn.close();
        },
      );
    });
  }

  void reg(String lastname, String firstname, String mail, String pass,
      String repeatPass) async {
    getConnection().then((conn) {
      conn
          .query(
              'insert into users (login, pass, firstname, lastname) values ("$mail", "$pass", "$firstname", "$lastname")')
          .then(
        (results) {
          if (results.first["login"].runtimeType == MySqlException) {
            throw new MySqlClientError('yes');
          }
          conn.close();
        },
      );
    });
  }
}
