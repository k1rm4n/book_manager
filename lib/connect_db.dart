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

  Future<Results?> getBookData(int userId) async {
    final connection = await getConnection();
    final result = await connection.query(
        '''select l.id as id_like_status, b.id, b.name_author, b.name_book, b.limit_age, 
    b.category, b.public_book, b.year_book, b.description_book, b.content_book, b.img_book, 
    b.img_author, b.count_book, b.pages_book, ifnull(l.like_state, 0) as like_state from books as b left join book_likes as l on b.id = l.book_id 
    and $userId = l.user_id ''');
    await connection.close();
    return result;
  }
  // при нажатии на лайк isLiked = true
  // при нажатии на дизлайк isLiked = false

  Future<Results?> updateLikeBook(int likeState, int userId, int bookId) async {
    final connection = await getConnection();
    final result = await connection.query(
        'insert into book_likes (user_id, book_id, like_state) values($userId, $bookId, $likeState) on duplicate key update like_state = $likeState');
    await connection.close();
    return result;
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
                arguments: NameAndLogin(
                    getFirstAndLastName(
                        results.first["lastname"], results.first["firstname"]),
                    results.first["login"],
                    results.first["id"]));
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
  int id = 0;
  NameAndLogin(this.name, this.login, this.id);
}
