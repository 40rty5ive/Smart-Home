import 'package:flutter/material.dart';
import 'package:smart_home_layot/widgets/home_page/home_page_widget.dart';
import 'package:smart_home_layot/widgets/smart_light_page/smart_light_widget.dart';

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
        backgroundColor: const Color.fromRGBO(242, 242, 242, 1.0),
        primaryColor: Colors.grey,
        
      ),
      routes: {
        '/homePage': (context) => const HomePageWidget(),
        '/homePage/smart_light': (context) => const SmartLightWidget(),
      },
      initialRoute: '/homePage',
    );
  }
}
