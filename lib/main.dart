import 'package:flutter/material.dart';
import 'package:zabo_mini/modules/group/group_page.dart';
import 'package:zabo_mini/modules/home/home_page.dart';
import 'package:zabo_mini/modules/zabo_detail/zabo_detail_page.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zabo App',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/zabo-detail': (context) => const ZaboDetail(),
        '/group': (context) => const Group(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.black,
        ),
        textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.black)),
      ),
    );
  }
}
