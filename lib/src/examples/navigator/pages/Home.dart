import 'package:flutter/material.dart';
import 'package:flutter_demo_components/src/examples/banner/UiSwiper.dart';

const APPBAR_SCROLL_OFFSET = 100;
class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeState();
  }
}

class _HomeState extends State<Home>{
  double _appBarAlpha = 0;

  _onScroll (offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    alpha = alpha < 0 ? 0 : alpha;
    alpha = alpha > 1 ? 1 : alpha;
    setState(() {
      _appBarAlpha = alpha;
    });
    print(_appBarAlpha);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: NotificationListener(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollUpdateNotification && scrollNotification.depth == 0) {
                  _onScroll(scrollNotification.metrics.pixels);
                }
              },
              child: ListView (
                children: <Widget>[UiSwipe(), Container(height: 800, child: ListTile(title: Text('哈哈'),),)],
              )
          )
        ),
        Opacity(
          opacity: _appBarAlpha,
          child: Container(
            height: 80,
            decoration: BoxDecoration(color: Colors.white),
            child: Center(child: Padding(padding: EdgeInsets.only(top: 20), child: Text('首页'),),)
          )
        )],
      )
    );
  }
}