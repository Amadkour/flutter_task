import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constant/color.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
    MyAppBar(
      {Key? key, required this.title, this.hasBackButton = true, this.action})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  final String title;
  final bool hasBackButton;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.2,
      automaticallyImplyLeading: true,
      leading: hasBackButton
          ? BackButton(
              onPressed: () {
                Navigator.pop(context);
              },
              color: AppColors.blackColor,
            )
          : null,
      actions: action != null ? [action!] : [],
      title: Text(
        title,),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }

  @override
  final Size preferredSize;
}
