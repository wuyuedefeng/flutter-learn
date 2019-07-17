// https://pub.dev/packages/flutter_swiper
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class UiSwipe extends StatelessWidget {
  List _imgUrls = [
    'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1906621981,3646632497&fm=26&gp=0.jpg',
    'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=4208432394,1570340799&fm=26&gp=0.jpg',
    'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1900077360,395537040&fm=26&gp=0.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 160,
      child: Swiper(
        itemCount: _imgUrls.length,
        autoplay: true,
        itemBuilder: (BuildContext buildContext, int idx) {
          return Image.network(_imgUrls[idx], fit: BoxFit.fill);
        },
        pagination: SwiperPagination(),
        viewportFraction: 0.8,
        scale: 0.8,
      )
    );
  }
}
