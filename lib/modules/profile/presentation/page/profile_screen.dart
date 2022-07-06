import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task/core/constant/color.dart';
import 'package:flutter_task/core/widget/my_image.dart';

import '../../../../core/widget/app_bar.dart';
import '../../controller/profile_controller.dart';
import '../widget/images_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as List;
    return Scaffold(
        appBar:
        MyAppBar(
          title:routeArgs[0].name ,
        ),

        body: Consumer(
          builder: (BuildContext context,
              T Function<T>(ProviderBase<Object?, T>) watch, Widget? child) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.read(index).state = routeArgs[0].id!;
            });
            final controller = watch(imagesController);
            return Center(
              child: controller.when(
                data: (data) => Column(
                  children: [
                    Hero(
                      tag: 'profile',
                      child: MyImage(
                        url:
                            'https://image.tmdb.org/t/p/w500/${routeArgs[0].profilePath}',
                        height: 100,
                        width: 100,
                        originalHeight: MediaQuery.of(context).size.height,
                        originalWidth: MediaQuery.of(context).size.width,
                        fit: BoxFit.fill,
                        boarderRadius: 50,
                        title:routeArgs[0].name ,

                        canClick: true,
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ImagesWidget(
                          images: data,
                           name: routeArgs[0].name ?? ''
                        ),
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
