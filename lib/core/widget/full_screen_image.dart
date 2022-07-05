import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/core/widget/my_image.dart';

class FullScreenImage extends StatelessWidget {
  const FullScreenImage({Key? key, required this.url, required this.height, required this.width}) : super(key: key);
  final String url;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyImage(
        url: url,
        height: height,
        width: width,
      ),
    );
  }
}
