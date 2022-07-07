import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task/core/constant/color.dart';

import '../constant/routes.dart';

class MyImage extends StatelessWidget {
  final double? height;

  final double? width;
  final double? originalHeight;
  final double? originalWidth;

  final double? boarderRadius;

  final Color? color;
  final BoxFit? fit;
  final bool canClick;
  final String? defaultUrl;

  final String? url;
  final String? title;

  final Widget? defaultDesign;

  const MyImage({
    Key? key,
    this.height = 100,
    this.width = 100,
    this.color,
    this.fit = BoxFit.contain,
    this.defaultUrl = 'assets/images/logo.jpeg',
    this.defaultDesign,
    this.url,
    this.boarderRadius = 0.0,
    this.originalHeight,
    this.originalWidth,
     this.title,
     this.canClick=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: url == null
          ? defaultDesign ??
              (defaultUrl!.toLowerCase().endsWith(".svg")
                  ? SvgPicture.asset(
                      defaultUrl!,
                      width: width,
                      height: height,
                      fit: fit ?? BoxFit.contain,
                      color: Colors.transparent,
                      placeholderBuilder: (v) => const Center(
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          // child:
                          // MyLoading()
                        ),
                      ),
                    )
                  : Image.asset(
                      defaultUrl!,
                      width: width,
                      height: height,
                      fit: fit ?? BoxFit.contain,
                    ))
          : url!.startsWith("http")
              ? url!.toLowerCase().endsWith(".svg")
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(boarderRadius!),
                      child: SvgPicture.network(
                        url!,
                        width: width,
                        height: height,
                        fit: fit ?? BoxFit.contain,
                        placeholderBuilder: (context) => Image.asset(
                          defaultUrl!,
                          height: height,
                          width: width,
                          fit: fit ?? BoxFit.fill,
                        ),
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(boarderRadius!),
                      child: Image.network(url!,
                          width: width,
                          height: height,
                          fit: fit, loadingBuilder: (context, child, c) {
                        if (c == null) return child;
                        return Center(
                          child: SizedBox(
                              height: 50,
                              width: 50,
                              child: CircularProgressIndicator(
                                color: AppColors.primaryColor,
                              )),
                        );
                      }, errorBuilder: (context, child, error) {
                        if (defaultDesign != null) {
                          return defaultDesign!;
                        }
                        return MyImage(
                          url: defaultUrl!,
                          height: height,
                          width: width,
                          title:title ,
                          fit: fit ?? BoxFit.contain,
                          color: AppColors.darkGreyColor,
                        );
                      }),
                    )
              : url!.toLowerCase().endsWith(".svg")
                  ? color == null
                      ? SvgPicture.asset(
                          url!,
                          // allowDrawingOutsideViewBox: true,
                          width: width,
                          height: height,
                          fit: fit ?? BoxFit.contain,
                          placeholderBuilder: (context) => Image.asset(
                            defaultUrl!,
                            height: height,
                            width: width,
                            fit: fit ?? BoxFit.contain,
                          ),
                        )
                      : SvgPicture.asset(
                          url!,
                          // allowDrawingOutsideViewBox: true,
                          width: width,
                          height: height,
                          color: color,
                          fit: fit ?? BoxFit.contain,
                          placeholderBuilder: (context) => Image.asset(
                            defaultUrl!,
                            height: height,
                            width: width,
                            fit: fit ?? BoxFit.contain,
                          ),
                        )
                  : url!.startsWith("assets/images")
                      ? Image.asset(
                          url!,
                          width: width,
                          height: height,
                          fit: fit ?? BoxFit.contain,
                          errorBuilder: (context, child, error) => Image.asset(
                            defaultUrl!,
                            height: height,
                            width: width,
                            fit: fit ?? BoxFit.contain,
                          ),
                        )
                      : Image.file(
                          File(url!),
                          fit: fit ?? BoxFit.contain,
                          height: height,
                          width: width,
                          errorBuilder: (context, child, error) => Image.asset(
                            defaultUrl!,
                            height: height,
                            width: width,
                            fit: fit ?? BoxFit.contain,
                          ),
                        ),
      onTap: () {
        if (canClick) {
          Navigator.pushNamed(
            context,
            Routes.fullScreenImage,
            arguments: [ url!, originalWidth!,originalHeight!,title],
          );
        }
      },
    );
  }
}
