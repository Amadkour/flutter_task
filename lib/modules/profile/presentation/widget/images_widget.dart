import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/core/widget/my_image.dart';
import 'package:flutter_task/modules/profile/provider/model/details_model.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/strings.dart';

class ImagesWidget extends StatelessWidget {
  const ImagesWidget({Key? key, required this.images, required this.name}) : super(key: key);
  final List<DetailsModel> images;
  final String name;
  @override
  Widget build(BuildContext context) {
    return images.isNotEmpty? Column(
      children: [
        Row(
          children:  [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'All Images',
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: AppColors.darkGreyColor,
                  fontSize: 16,
            ),),)
          ],
        ),
        Flexible(
          child: Center(
            child: GridView.builder(
              itemBuilder: (c, i) => MyImage(url:
                '${AppStrings.imageBaseUrl}${images[i].filePath}',
                originalWidth:images[i].width! ,
                originalHeight: images[i].height!,
                canClick: true,
                title:name ,
              ),
              itemCount: images.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.width * 1.5),
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2),
            ),
          ),
        ),
      ],
    ):
    const Center(child: Text('Don\'t have images'))
    ;
  }
}
