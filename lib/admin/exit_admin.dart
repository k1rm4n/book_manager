import 'package:book_manager/connect_db.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExitAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.popAndPushNamed(context, '/auto');
                  },
                  child: Align(
                    child: Container(
                      width: double.infinity,
                      height: 43,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color.fromRGBO(76, 61, 255, 1),
                        ),
                      ),
                      child: const Align(
                        child: Text(
                          'Выйти',
                          style: TextStyle(
                            color: Color.fromRGBO(76, 61, 255, 1),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
