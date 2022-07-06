import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task/core/constant/color.dart';
import 'package:flutter_task/core/widget/my_image.dart';

import '../../controller/profile_controller.dart';
import '../../provider/model/Person_model.dart';
import '../widget/images_widget.dart';

class ProfileScreen extends StatelessWidget {

  @override
  build(BuildContext context) {
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
          title: Text(
            routeArgs[0].name!,
            style: const TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: Consumer(
          builder: (BuildContext context,
              T Function<T>(ProviderBase<Object?, T>) watch, Widget? child) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.read(index).state = routeArgs[0].id!;
            });
            final controller=watch(imagesController);
            return Center(
              child: controller.when(
                    data: (d) => Column(
                      children: [
                        Hero(
                          tag: 'profile',
                          child: MyImage(
                            url:
                                'https://image.tmdb.org/t/p/w500/${routeArgs[0].profilePath}',
                            height: 100,
                            width: 100,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          routeArgs[0].name ?? '',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        Flexible(
                          child: ImagesWidget(
                            images: d,
                          ),
                        ),
                      ],
                    ),
                    loading: () => const CircularProgressIndicator(),
                    error: (e, i) => Text(
                      e.toString(),
                    ),
                  ),
            );
          },
        ));
  }
}
