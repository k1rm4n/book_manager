// ignore_for_file: deprecated_member_use

import 'package:book_manager/connect_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:book_manager/auto_user.dart';
import 'data/auto_data.dart';
import 'package:provider/provider.dart';

class Autorization extends StatelessWidget {
  final Shader linearGradient = const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: <Color>[
        Color.fromRGBO(103, 152, 230, 1),
        Color.fromRGBO(76, 61, 255, 1),
      ],
      stops: [
        0.4,
        0.8
      ]).createShader(const Rect.fromLTWH(65, 302, 245, 62));

  final _mailController = TextEditingController();
  final _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      // resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (context) => AutoData(),
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Center(
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/book.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: SizedBox(
                          width: 160,
                          height: 70,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'BOOK\n',
                                  style: TextStyle(
                                    foreground: Paint()
                                      ..shader = linearGradient,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Roboto',
                                    letterSpacing: 20,
                                  ),
                                ),
                                TextSpan(
                                  text: 'MANAGER',
                                  style: TextStyle(
                                    foreground: Paint()
                                      ..shader = linearGradient,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      EmailTextFieldWidget(mailController: _mailController),
                      const SizedBox(
                        height: 10,
                      ),
                      _PassTextFieldWidget(passController: _passController),
                      const SizedBox(
                        height: 20,
                      ),
                      // Align(
                      //   alignment: Alignment.centerRight,
                      //   child: RichText(
                      //     text: const TextSpan(
                      //       text: 'Забыли пароль?',
                      //       style: TextStyle(
                      //         fontWeight: FontWeight.w300,
                      //         fontSize: 12,
                      //         color: Color.fromRGBO(89, 89, 89, 1),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 30,
                      ),
                      _ButtonWidget(
                        mailController: _mailController,
                        passController: _passController,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              const TextSpan(
                                text: 'Новый пользователь? ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                  color: Color(0xFF464646),
                                  fontFamily: 'Roboto',
                                ),
                              ),
                              TextSpan(
                                  text: 'Зарегистрироваться',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Color.fromRGBO(61, 104, 255, 1),
                                    fontFamily: 'Roboto',
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.popAndPushNamed(
                                          context, '/reg');
                                    }),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ), // Кнопка "Войти"
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PassTextFieldWidget extends StatefulWidget {
  const _PassTextFieldWidget({
    Key? key,
    required TextEditingController passController,
  })  : _passController = passController,
        super(key: key);

  final TextEditingController _passController;

  @override
  State<_PassTextFieldWidget> createState() => _PassTextFieldWidgetState();
}

class _PassTextFieldWidgetState extends State<_PassTextFieldWidget> {
  bool _passwordVisible = false;
  void initState() {
    _passwordVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextField(
        controller: widget._passController,
        obscureText: _passwordVisible,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w300,
          fontFamily: "Roboto",
        ),
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: Provider.of<AutoData>(context).textPass,
          suffixIcon: IconButton(
            icon: Icon(
              _passwordVisible ? Icons.visibility_off : Icons.visibility,
              color: const Color.fromRGBO(103, 152, 230, 1),
            ),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 30),
          labelStyle: Provider.of<AutoData>(context).textStyle,
          focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                  color: Provider.of<AutoData>(context).defBorder, width: 1)),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
                color: Provider.of<AutoData>(context).defBorder, width: 1),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
                color: Provider.of<AutoData>(context).defBorder, width: 1),
          ),
        ),
      ),
    );
  }
}

class _ButtonWidget extends StatefulWidget {
  _ButtonWidget({
    Key? key,
    required TextEditingController mailController,
    required TextEditingController passController,
  })  : _mailController = mailController,
        _passController = passController,
        super(key: key);

  final TextEditingController _mailController;
  final TextEditingController _passController;

  @override
  State<_ButtonWidget> createState() =>
      _ButtonWidgetState(_mailController, _passController);
}

class _ButtonWidgetState extends State<_ButtonWidget> {
  final TextEditingController _mailController;
  final TextEditingController _passController;
  _ButtonWidgetState(this._mailController, this._passController);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          MyConnection()
              .auto(_mailController.text, _passController.text, context);
        });
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.2),
              offset: Offset(0, 5),
              blurRadius: 8,
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(103, 152, 230, 1),
              Color.fromRGBO(76, 61, 230, 1),
            ],
            stops: [0, 1],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Center(
          child: RichText(
            text: const TextSpan(
              text: 'Войти',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EmailTextFieldWidget extends StatelessWidget {
  EmailTextFieldWidget({
    Key? key,
    required TextEditingController mailController,
  })  : _mailController = mailController,
        super(key: key);

  final TextEditingController _mailController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextField(
        controller: _mailController,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w300,
          fontFamily: "Roboto",
        ),
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: Provider.of<AutoData>(context).textLogin,
          contentPadding: const EdgeInsets.symmetric(horizontal: 30),
          labelStyle: Provider.of<AutoData>(context).textStyle,
          focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                  color: Provider.of<AutoData>(
                    context,
                  ).defBorder,
                  width: 1)),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
                color: Provider.of<AutoData>(context).defBorder, width: 1),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
                color: Provider.of<AutoData>(context).defBorder, width: 1),
          ),
        ),
      ),
    );
  }
}
