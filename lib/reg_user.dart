// ignore_for_file: deprecated_member_use

import 'package:book_manager/connect_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import 'data_reg.dart';

class Registration extends StatelessWidget {
  final _lastname = TextEditingController();
  final _firstname = TextEditingController();
  final _mail = TextEditingController();
  final _pass = TextEditingController();
  final _repeatPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegData(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Stack(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 28, vertical: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.popAndPushNamed(context, '/auto');
                        },
                        child: Container(
                          child: const Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Color.fromRGBO(61, 104, 255, 1),
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          'Регистрация',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromRGBO(61, 104, 255, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                _fieldListWidget(
                    lastname: _lastname,
                    firstname: _firstname,
                    mail: _mail,
                    pass: _pass,
                    repeatPass: _repeatPass),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _fieldListWidget extends StatelessWidget {
  const _fieldListWidget({
    Key? key,
    required TextEditingController lastname,
    required TextEditingController firstname,
    required TextEditingController mail,
    required TextEditingController pass,
    required TextEditingController repeatPass,
  })  : _lastname = lastname,
        _firstname = firstname,
        _mail = mail,
        _pass = pass,
        _repeatPass = repeatPass,
        super(key: key);

  final TextEditingController _lastname;
  final TextEditingController _firstname;
  final TextEditingController _mail;
  final TextEditingController _pass;
  final TextEditingController _repeatPass;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 117,
          ),
          _LastNameTextFieldWidget(lastname: _lastname),
          SizedBox(
            height: Provider.of<RegData>(context).defSizedHeight,
            child: Provider.of<RegData>(context).rowPresetLastName,
          ),
          _FirstNameTextFieldWidget(firstname: _firstname),
          SizedBox(
            height: Provider.of<RegData>(context).defSizedHeight,
            child: Provider.of<RegData>(context).rowPresetFirstName,
          ),
          _MailTextFieldWidget(mail: _mail),
          SizedBox(
            height: Provider.of<RegData>(context).defSizedHeight,
            child: Provider.of<RegData>(context).rowPresetMail,
          ),
          _PassTextFieldWidget(pass: _pass),
          SizedBox(
            height: _mail.text != ''
                ? Provider.of<RegData>(context).defSizedHeightPass
                : Provider.of<RegData>(context).defSizedHeight,
            child: Provider.of<RegData>(context).rowPresetPass,
          ),
          _RepeatPassTextFieldWidget(repeatPass: _repeatPass),
          SizedBox(
            height: Provider.of<RegData>(context).defSizedHeight,
            child: Provider.of<RegData>(context).rowPresetRepeatPass,
          ),
          const SizedBox(
            height: 40,
          ),
          // Кнопка "Зарегестрироваться"
          _RegButtonWidget(
            lastname: _lastname,
            firstname: _firstname,
            mail: _mail,
            pass: _pass,
            repeatPass: _repeatPass,
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}

class _RegButtonWidget extends StatefulWidget {
  _RegButtonWidget({
    Key? key,
    required TextEditingController lastname,
    required TextEditingController firstname,
    required TextEditingController mail,
    required TextEditingController pass,
    required TextEditingController repeatPass,
  })  : _lastname = lastname,
        _firstname = firstname,
        _mail = mail,
        _pass = pass,
        _repeatPass = repeatPass,
        super(key: key);

  final TextEditingController _lastname;
  final TextEditingController _firstname;
  final TextEditingController _mail;
  final TextEditingController _pass;
  final TextEditingController _repeatPass;

  @override
  State<_RegButtonWidget> createState() =>
      _RegButtonWidgetState(_lastname, _firstname, _mail, _pass, _repeatPass);
}

class _RegButtonWidgetState extends State<_RegButtonWidget> {
  final TextEditingController _lastname;
  final TextEditingController _firstname;
  final TextEditingController _mail;
  final TextEditingController _pass;
  final TextEditingController _repeatPass;
  _RegButtonWidgetState(this._lastname, this._firstname, this._mail, this._pass,
      this._repeatPass);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          var passRegex = RegExp(
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
          var mailRegex = RegExp(
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

          // List<String> listField = [
          //   _firstname.text,
          //   _lastname.text,
          //   _mail.text,
          //   _pass.text,
          //   _repeatPass.text
          // ];

          if (_lastname.text.isEmpty) {
            Provider.of<RegData>(context, listen: false).setRedTextAndBorder();
            Provider.of<RegData>(context, listen: false).setSizedHeight();
            Provider.of<RegData>(context, listen: false)
                .setRowPresetLastName('Введите фамилию');
          } else if (_firstname.text.isEmpty) {
            Provider.of<RegData>(context, listen: false).setRedTextAndBorder();
            Provider.of<RegData>(context, listen: false).setSizedHeight();
            Provider.of<RegData>(context, listen: false)
                .setRowPresetFirstName('Введите имя');
          } else if (!mailRegex.hasMatch(_mail.text)) {
            Provider.of<RegData>(context, listen: false).setRedTextAndBorder();
            Provider.of<RegData>(context, listen: false).setSizedHeight();
            _mail.text.isEmpty
                ? Provider.of<RegData>(context, listen: false)
                    .setRowPresetMail('Введите электронную почту')
                : Provider.of<RegData>(context, listen: false).setRowPresetMail(
                    'Электронная почта неверная. Проверьте электронную почту');
            Provider.of<RegData>(context, listen: false).setSizedHeight();
          } else if (!passRegex.hasMatch(_pass.text)) {
            Provider.of<RegData>(context, listen: false).setRedTextAndBorder();
            Provider.of<RegData>(context, listen: false).setRowPresetPass(
                "Пароль должен содержать восьми или более символов латинского алфавита, содержать заглавные и строчные буквы, цифры и иметь не менее одного из следующих символов: !  @ # \$ & * ~");
            Provider.of<RegData>(context, listen: false).setSizedHeightPass();
          } else if (_pass.text != _repeatPass.text) {
            Provider.of<RegData>(context, listen: false).defRowPresetPass();
            Provider.of<RegData>(context, listen: false).defSizedPass();
            Provider.of<RegData>(context, listen: false).setSizedHeight();
            Provider.of<RegData>(context, listen: false).setRedTextAndBorder();
            Provider.of<RegData>(context, listen: false)
                .setRowPresetRepeatPass('Пароль не совпадает с предыдущим');
          } else {
            MyConnection().reg(_lastname.text, _firstname.text, _mail.text,
                _pass.text, _repeatPass.text, context);
            _lastname.text = '';
            _firstname.text = '';
            _mail.text = '';
            _pass.text = '';
            _repeatPass.text = '';
          }
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
              text: 'Зарегестрироваться',
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
    );
  }
}

class _RepeatPassTextFieldWidget extends StatefulWidget {
  const _RepeatPassTextFieldWidget({
    Key? key,
    required TextEditingController repeatPass,
  })  : _repeatPass = repeatPass,
        super(key: key);

  final TextEditingController _repeatPass;

  @override
  State<_RepeatPassTextFieldWidget> createState() =>
      _RepeatPassTextFieldWidgetState();
}

class _RepeatPassTextFieldWidgetState
    extends State<_RepeatPassTextFieldWidget> {
  @override
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
        controller: widget._repeatPass,
        obscureText: _passwordVisible,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w300,
          fontFamily: "Roboto",
        ),
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: "Повторите пароль",
          contentPadding: const EdgeInsets.symmetric(horizontal: 30),
          suffixIcon: IconButton(
            icon: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: const Color.fromRGBO(103, 152, 230, 1),
            ),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
          labelStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter',
            color: Provider.of<RegData>(context).defTextColor,
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                  color: Provider.of<RegData>(context).defBorder, width: 1)),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
                color: Provider.of<RegData>(context).defBorder, width: 1),
          ),
        ),
      ),
    );
  }
}

class _PassTextFieldWidget extends StatefulWidget {
  const _PassTextFieldWidget({
    Key? key,
    required TextEditingController pass,
  })  : _pass = pass,
        super(key: key);

  final TextEditingController _pass;

  @override
  State<_PassTextFieldWidget> createState() => _PassTextFieldWidgetState();
}

class _PassTextFieldWidgetState extends State<_PassTextFieldWidget> {
  @override
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
        controller: widget._pass,
        obscureText: _passwordVisible,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w300,
          fontFamily: "Roboto",
        ),
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: "Пароль",
          contentPadding: const EdgeInsets.symmetric(horizontal: 30),
          suffixIcon: IconButton(
            icon: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: const Color.fromRGBO(103, 152, 230, 1),
            ),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
          labelStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter',
            color: Provider.of<RegData>(context).defTextColor,
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                  color: Provider.of<RegData>(context).defBorder, width: 1)),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
                color: Provider.of<RegData>(context).defBorder, width: 1),
          ),
        ),
      ),
    );
  }
}

class _MailTextFieldWidget extends StatelessWidget {
  const _MailTextFieldWidget({
    Key? key,
    required TextEditingController mail,
  })  : _mail = mail,
        super(key: key);

  final TextEditingController _mail;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextField(
        controller: _mail,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w300,
          fontFamily: "Roboto",
        ),
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: "E-mail",
          contentPadding: const EdgeInsets.symmetric(horizontal: 30),
          labelStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            fontFamily: "Inter",
            color: Provider.of<RegData>(context).defTextColor,
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                  color: Provider.of<RegData>(context).defBorder, width: 1)),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
                color: Provider.of<RegData>(context).defBorder, width: 1),
          ),
        ),
      ),
    );
  }
}

class _FirstNameTextFieldWidget extends StatelessWidget {
  const _FirstNameTextFieldWidget({
    Key? key,
    required TextEditingController firstname,
  })  : _firstname = firstname,
        super(key: key);

  final TextEditingController _firstname;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextField(
        controller: _firstname,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w300,
          fontFamily: "Roboto",
        ),
        decoration: InputDecoration(
          labelText: 'Имя',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.symmetric(horizontal: 30),
          labelStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            fontFamily: "Inter",
            color: Provider.of<RegData>(context).defTextColor,
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                  color: Provider.of<RegData>(context).defBorder, width: 1)),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
                color: Provider.of<RegData>(context).defBorder, width: 1),
          ),
        ),
      ),
    );
  }
}

class _LastNameTextFieldWidget extends StatelessWidget {
  const _LastNameTextFieldWidget({
    Key? key,
    required TextEditingController lastname,
  })  : _lastname = lastname,
        super(key: key);

  final TextEditingController _lastname;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextField(
        controller: _lastname,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w300,
          fontFamily: "Roboto",
        ),
        decoration: InputDecoration(
          labelText: 'Фамилия',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.symmetric(horizontal: 30),
          labelStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            fontFamily: "Inter",
            color: Provider.of<RegData>(context).defTextColor,
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                  color: Provider.of<RegData>(context).defBorder, width: 1)),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
                color: Provider.of<RegData>(context).defBorder, width: 1),
          ),
        ),
      ),
    );
  }
}
