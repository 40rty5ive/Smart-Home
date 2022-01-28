import 'package:flutter/material.dart';
import 'package:smart_home_layot/widgets/home_page/home_tab_widget.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      const HomeTabWidget(),
      const Center(
          child: Icon(Icons.bolt_outlined, size: 64.0, color: Colors.cyan)),
      const Center(
          child: Icon(Icons.query_stats, size: 64.0, color: Colors.blue)),
      const Center(
          child: Icon(Icons.account_circle_outlined,
              size: 64.0, color: Colors.blue)),
    ];
    final _kBottmonNavBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined), label: 'Home'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.bolt_outlined), label: 'Fast'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.query_stats), label: 'Statistics'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined), label: 'Account'),
    ];
    assert(_kTabPages.length == _kBottmonNavBarItems.length);
    final bottomNavBar = BottomNavigationBar(
      items: _kBottmonNavBarItems,
      currentIndex: _currentTabIndex,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (int index) {
        setState(() {
          _currentTabIndex = index;
        });
      },
    );
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 242, 242, 1.0),
      body: _kTabPages[_currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}
