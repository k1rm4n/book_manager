import 'package:mysql1/mysql1.dart';
import 'package:flutter/material.dart';
import 'data/auto_data.dart';
import 'package:provider/provider.dart';
import 'data/profile_data.dart';
import 'data_reg.dart';

class MyConnection {
  Future<MySqlConnection> getConnection() async {
    var settings = ConnectionSettings(
      host: 'mysql.gameoxford.ru',
      port: 3306,
      user: 'krotov',
      password: 'pOQ7gO',
      db: 'krotov_bm_db',
      timeout: const Duration(seconds: 3),
    );

    return await MySqlConnection.connect(settings);
  }

  Future<Results?> getBookData() async {
    final connection = await getConnection();
    final result = await connection.query('select * from books');
    await connection.close();
    return result;
  }
  // при нажатии на лайк isLiked = true
  // при нажатии на дизлайк isLiked = false

  Future<Results?> updateIdBook(int stateLike, int idBook) async {
    final connection = await getConnection();
    final result = await connection
        .query('update books set like_book=$stateLike where id=$idBook');
    await connection.close();
    return result;
  }

  void auto(String mail, String pass, BuildContext context) async {
    String getFirstAndLastName(var lastname, var firstname) {
      return "$lastname $firstname";
    }

    String getMail(var mail) {
      return "$mail";
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
                arguments: NameAndLogin(
                    getFirstAndLastName(
                        results.first["lastname"], results.first["firstname"]),
                    getMail(results.first["login"])));
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
      String repeatPass, BuildContext context) async {
    getConnection().then((conn) {
      conn
          .query(
              'insert into users (login, pass, firstname, lastname) values ("$mail", "$pass", "$firstname", "$lastname")')
          .then(
        (results) {
          Provider.of<RegData>(context, listen: false).defColorTextAndBorder();
          Provider.of<RegData>(context, listen: false).defSizedPass();
          Provider.of<RegData>(context, listen: false).defSized();
          Provider.of<RegData>(context, listen: false).defRowPresetLastName();
          Provider.of<RegData>(context, listen: false).defRowPresetFirstName();
          Provider.of<RegData>(context, listen: false).defRowPresetMail();
          Provider.of<RegData>(context, listen: false).defRowPresetPass();
          Provider.of<RegData>(context, listen: false).defRowPresetRepeatPass();

          conn.close();
        },
      ).catchError((e) {
        Provider.of<RegData>(context, listen: false).setRedTextAndBorder();
        Provider.of<RegData>(context, listen: false).setSizedHeight();
        Provider.of<RegData>(context, listen: false)
            .setRowPresetLastName('Обязательное поле');
        Provider.of<RegData>(context, listen: false)
            .setRowPresetFirstName('Обязательное поле');
        Provider.of<RegData>(context, listen: false)
            .setRowPresetMail('Такой e-mail уже существует');
        Provider.of<RegData>(context, listen: false)
            .setRowPresetPass('Обязательное поле');
        Provider.of<RegData>(context, listen: false)
            .setRowPresetRepeatPass('Обязательное поле');
      });
    });
  }

  void printLibraryData(
    String nameAuthor,
    String nameBook,
    String limitAge,
    String categoryBook,
    String publicBook,
    String yearBook,
    String descriptionBook,
    String contentBook,
    String imgBook,
    String imgAuthor,
    String countBook,
    String pagesBook,
    BuildContext context,
  ) async {
    getConnection().then((conn) {
      conn
          .query(
              'insert into books (name_author, name_book, limit_age, category, public_book, year_book, description_book, content_book, img_book, img_author, count_book, pages_book) values ("$nameAuthor", "$nameBook", "$limitAge", "$categoryBook", "$publicBook", "$yearBook", "$descriptionBook", "$contentBook", "$imgBook", "$imgAuthor", "$countBook", "$pagesBook")')
          .then(
        (results) {
          conn.close();
        },
      );
    });
  }
}

class NameAndLogin {
  String name = '';
  String login = '';
  NameAndLogin(this.name, this.login);
}
