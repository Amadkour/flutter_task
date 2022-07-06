import 'package:flutter/cupertino.dart';
import 'package:flutter_task/core/widget/my_image.dart';
import 'package:flutter_task/modules/profile/provider/model/details_model.dart';

class ImagesWidget extends StatelessWidget {
  const ImagesWidget({Key? key, required this.images}) : super(key: key);
  final List<DetailsModel> images;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemBuilder: (c, i) => MyImage(url:
        'https://image.tmdb.org/t/p/w500/${images[i].filePath}',
        originalWidth:images[i].width! ,
        originalHeight: images[i].height!,
        canClick: true,
      ),
      itemCount: images.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.width * 1.5),
          mainAxisSpacing: 2,
          crossAxisSpacing: 2),
    );
  }
}
