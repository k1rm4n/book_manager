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

  Future<Results?> updateBook(
    int bookId,
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
  ) async {
    final connection = await getConnection();
    final results =
        await connection.query('''update books set name_author = '$nameAuthor', 
        name_book = '$nameBook', limit_age = $limitAge, category = '$categoryBook', 
        public_book = '$publicBook', year_book = '$yearBook', 
        description_book = '$descriptionBook', content_book = '$contentBook', 
        img_book = '$imgBook', img_author = '$imgAuthor', 
        count_book = $countBook, pages_book = $pagesBook  where id = $bookId''');
    await connection.close();
    return results;
  }

  Future<Results?> getBookForId(int bookId) async {
    final connection = await getConnection();
    final results =
        await connection.query('select * from books where id = $bookId');
    await connection.close();
    return results;
  }

  Future<Results?> getBookDataForEdit() async {
    final connection = await getConnection();
    final results = await connection.query('select * from books');
    await connection.close();
    return results;
  }

  Future<Results?> getBookData(int userId, {String where = ''}) async {
    final connection = await getConnection();
    final result = await connection.query(
        '''select l.id as id_like_status, b.id, b.name_author, b.name_book, b.limit_age, 
    b.category, b.public_book, b.year_book, b.description_book, b.content_book,
    b.img_book, b.img_author, b.count_book, b.pages_book, 
    ifnull(l.like_state, 0) as like_state, if(q.book_id is null, 0 , 1) as query_book
    from books as b
    left join book_likes as l on b.id = l.book_id  and $userId = l.user_id
    left join book_query as q on b.id = q.book_id  and $userId = q.user_id
    $where ''');
    await connection.close();
    return result;
  }

  Future<Results?> getHistory(int userId) async {
    final connection = await getConnection();
    final result = await connection.query(
        '''SELECT books.name_book, books.img_book, books.name_author,books.year_book 
          FROM book_histories 
          INNER JOIN books ON book_histories.book_id = books.id AND book_histories.user_id = $userId
          ORDER BY book_histories.history_date DESC''');
    await connection.close();
    return result;
  }

  Future<Results?> getWaitBook(int userId) async {
    final connection = await getConnection();
    final result = await connection.query(
        '''SELECT books.id,books.name_book, books.img_book, books.name_author,books.year_book 
          FROM book_query 
          INNER JOIN books ON book_query.book_id = books.id AND book_query.user_id = $userId''');
    await connection.close();
    return result;
  }

  Future<Results?> getAllWaitBook() async {
    final connection = await getConnection();
    final result = await connection.query(
        '''SELECT books.id AS book_id, users.id AS user_id,book_query.id,books.id,books.name_book, books.img_book, books.name_author, 
          books.year_book, users.firstname, users.lastname
          FROM book_query 
          INNER JOIN books ON book_query.book_id = books.id 
          INNER JOIN users ON users.id = book_query.user_id''');
    await connection.close();
    return result;
  }

  Future<Results?> acceptBook(int userId, int bookId) async {
    final connection = await getConnection();
    final result = await connection.query('''DELETE FROM book_user_reads
           WHERE book_user_reads.book_id = $bookId AND book_user_reads.user_id = $userId ''');
    await connection.close();
    return result;
  }

  Future<Results?> getAllReturnBook() async {
    final connection = await getConnection();
    final result = await connection.query(
        '''SELECT books.id AS book_id, users.id AS user_id,book_user_reads.id,books.id,books.name_book, books.img_book, books.name_author, 
          books.year_book, users.firstname, users.lastname
          FROM book_user_reads 
          INNER JOIN books ON book_user_reads.book_id = books.id 
          INNER JOIN users ON users.id = book_user_reads.user_id AND book_user_reads.book_return = 1''');
    await connection.close();
    return result;
  }

  Future<Results?> getReaders() async {
    final connection = await getConnection();
    final result =
        await connection.query('''SELECT users.firstname, users.lastname
          FROM book_user_reads AS readers
          INNER JOIN users ON readers.user_id = users.id AND readers.book_return = 0
          AND readers.second_date > now()
          GROUP BY users.firstname, users.lastname ''');
    await connection.close();
    return result;
  }

  Future<Results?> getDebtor() async {
    final connection = await getConnection();
    final result =
        await connection.query('''SELECT users.firstname, users.lastname
          FROM book_user_reads AS readers
          INNER JOIN users ON readers.user_id = users.id AND readers.book_return = 0 AND
          readers.second_date < now()
          GROUP BY users.firstname, users.lastname ''');
    await connection.close();
    return result;
  }

  Future<Results?> removeQueryBook(int userId, int bookId) async {
    final connection = await getConnection();
    final result = await connection.query('''DELETE FROM book_query
           WHERE book_query.book_id = $bookId AND book_query.user_id = $userId''');
    await connection.close();
    return result;
  }

  Future<Results?> addHistory(int userId, int bookId) async {
    final connection = await getConnection();
    final result = await connection.query(''' INSERT 
            INTO book_histories 
            (book_id, user_id, history_date) VALUES ($bookId, $userId, now())''');
    await connection.close();
    return result;
  }

  Future<Results?> getCountBookWantRead(int userId) async {
    final connection = await getConnection();
    final result = await connection.query(''' SELECT COUNT(*) as  count_book
            FROM book_likes 
            WHERE book_likes.user_id = $userId AND book_likes.like_state = 1''');
    await connection.close();
    return result;
  }

  Future<Results?> getReadBook(int userId) async {
    final connection = await getConnection();
    final result = await connection.query(
        '''SELECT books.id,books.name_book, books.img_book, books.name_author,books.year_book 
          FROM book_user_reads 
          INNER JOIN books ON book_user_reads.book_id = books.id AND book_user_reads.user_id = $userId''');
    await connection.close();
    return result;
  }

  Future<Results?> getImageReadBook(int userId) async {
    final connection = await getConnection();
    final result = await connection.query('''SELECT books.img_book 
          FROM book_user_reads 
          INNER JOIN books ON book_user_reads.book_id = books.id AND book_user_reads.user_id = $userId''');
    await connection.close();
    return result;
  }

  Future<Results?> returnBook(int userId, int bookId) async {
    final connection = await getConnection();
    final result = await connection.query('''UPDATE book_user_reads
           SET book_user_reads.book_return = 1
           WHERE book_user_reads.book_id = $bookId AND book_user_reads.user_id = $userId''');
    await connection.close();
    return result;
  }

  Future<Results?> addQuery(int userId, int bookId) async {
    final connection = await getConnection();
    final result = await connection.query(''' INSERT 
            INTO book_query 
            (book_id, user_id) VALUES ($bookId, $userId)''');
    await connection.close();
    return result;
  }

  Future<Results?> getFavorite(int userId) async {
    final connection = await getConnection();
    final result = await connection.query(
        '''SELECT books.name_book, books.img_book, books.name_author,books.year_book, books.id
          FROM books
          INNER JOIN book_likes
          ON books.id = book_likes.book_id and $userId = book_likes.user_id and book_likes.like_state = 1''');
    await connection.close();
    return result;
  }

  Future<Results?> removeFavorite(int userId, int bookId) async {
    return await updateLikeBook(0, userId, bookId);
  }

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
