import 'package:flutter/material.dart';
import 'package:smart_home_layot/widgets/home_page/home_page_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Home',
      theme: ThemeData(
        backgroundColor: const Color.fromRGBO(229, 229, 229, 1.0),
        primaryColor: Colors.grey,
      ),
      routes: {
        '/homePage': (context) => const HomePageWidget(),

      },
      initialRoute: '/homePage',
    );
  }
}
