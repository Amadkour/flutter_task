import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task/core/widget/my_image.dart';
import 'package:gallery_saver/gallery_saver.dart';

import '../constant/color.dart';

class FullScreenImage extends StatelessWidget {
  const FullScreenImage({Key? key, required this.url, required this.height, required this.width}) : super(key: key);
  final String url;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.2,
          automaticallyImplyLeading: true,
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: AppColors.blackColor,
          ),
          actions: [
            IconButton(onPressed: (){
              GallerySaver.saveImage(url).then((value) => print(value));
  }, icon: const Icon(Icons.save_alt))
          ],
          // title: Text(
          //   person.name!,
          //   style: const TextStyle(
          //       color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          // ),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),

      body: MyImage(
        url: url,
        height: height,
        width: width,
      ),
    );
  }
}
