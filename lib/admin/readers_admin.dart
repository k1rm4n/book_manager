import 'package:book_manager/data/ListData.dart';
import 'package:book_manager/data/reader_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReadersAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final readerData = ReaderData();
    readerData.getReaders();
    readerData.activeColorReaders();
    return ChangeNotifierProvider(
      create: (context) => readerData,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Expanded(
                        child: Text(
                          'Читатели',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromRGBO(76, 61, 255, 1),
                            fontSize: 20,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    _ReadersListWidget(),
                    SizedBox(
                      width: 15,
                    ),
                    _PromiserListWidget(),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const _ListViewWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ListViewWidget extends StatelessWidget {
  const _ListViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemBuilder: (context, index) =>
              Provider.of<ReaderData>(context).list[index],
          itemCount: Provider.of<ReaderData>(context).list.length,
        ),
      ],
    );
  }
}

class _ReadersListWidget extends StatelessWidget {
  const _ReadersListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<ReaderData>(context, listen: false).defPromiser();
        Provider.of<ReaderData>(context, listen: false).activeColorReaders();
        Provider.of<ReaderData>(context, listen: false).getReaders();
      },
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: double.infinity,
          maxHeight: 30,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color.fromRGBO(228, 228, 228, 1),
          ),
        ),
        child: Align(
          child: FittedBox(
            fit: BoxFit.cover,
            child: Text(
              'Список читателей',
              style: TextStyle(
                color: Provider.of<ReaderData>(context).defColorReaders,
                fontFamily: 'Roboto',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PromiserListWidget extends StatelessWidget {
  const _PromiserListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<ReaderData>(context, listen: false).defReaders();
        Provider.of<ReaderData>(context, listen: false).activeColorPromiser();
        Provider.of<ReaderData>(context, listen: false).getDebtor();
      },
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: double.infinity,
          maxHeight: 30,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color.fromRGBO(228, 228, 228, 1),
          ),
        ),
        child: Align(
          child: FittedBox(
            fit: BoxFit.cover,
            child: Text(
              'Список должников',
              style: TextStyle(
                color: Provider.of<ReaderData>(context).defColorPromiser,
                fontFamily: 'Roboto',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ListItemWidget extends StatelessWidget {
  final String firstName;
  final String lastName;
  const ListItemWidget({
    Key? key,
    required this.firstName,
    required this.lastName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: double.infinity,
        maxHeight: 52,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 2,
            color: Color.fromRGBO(0, 0, 0, 0.2),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: FittedBox(
              fit: BoxFit.cover,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '$firstName $lastName\n',
                      style: const TextStyle(
                        color: Color.fromRGBO(70, 70, 70, 1),
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    const TextSpan(
                      text: '10 класс',
                      style: TextStyle(
                        color: Color.fromRGBO(196, 196, 196, 1),
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
