import 'package:flutter/material.dart';
import 'package:flutter_demo_components/src/examples/navigator/pages/Home.dart';
import 'package:flutter_demo_components/src/examples/navigator/pages/Me.dart';

class TabsNavigator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TabsNavigatorState();
  }
}

class _TabsNavigatorState extends State<TabsNavigator> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;
  final PageController _controller = PageController(initialPage: 0);

  pageChanged(idx) {
    _controller.jumpToPage(idx);
    setState(() {
      _currentIndex = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: PageView(
          controller: _controller,
          children: <Widget>[Home(), Me()],
          onPageChanged: pageChanged),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: pageChanged,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: _defaultColor),
                activeIcon: Icon(Icons.home, color: _activeColor),
                title: Text(
                  '首页',
                  style: TextStyle(
                      color: _currentIndex != 0 ? _defaultColor : _activeColor),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle, color: _defaultColor),
                activeIcon: Icon(Icons.account_circle, color: _activeColor),
                title: Text(
                  '我的',
                  style: TextStyle(
                      color: _currentIndex != 1 ? _defaultColor : _activeColor),
                )),
          ]),
    );
  }
}
