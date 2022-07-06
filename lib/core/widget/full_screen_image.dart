import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task/core/widget/my_image.dart';
import 'package:gallery_saver/gallery_saver.dart';

import '../constant/color.dart';

class FullScreenImage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final routeArgs =
    ModalRoute.of(context)!.settings.arguments as List;

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
          IconButton(
              onPressed: () {
                GallerySaver.saveImage(routeArgs[0]).then((value) =>
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Image Saved Successfully'),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                    )));
              },
              icon: const Icon(
                Icons.save_alt,
                color: Colors.black,
              ))
        ],
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: MyImage(
        url: routeArgs[0],
        height: routeArgs[2],
        width: routeArgs[1],
      ),
    );
  }
}
