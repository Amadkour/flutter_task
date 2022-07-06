import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loadmore/loadmore.dart';
import '../../../../core/widget/app_bar.dart';
import '../../controller/home_controller.dart';
import '../widget/person_item_design.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar:
      MyAppBar(
        title:'Populars' ,
        hasBackButton: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer(
          builder: (BuildContext context,
              T Function<T>(ProviderBase<Object?, T>) watch, Widget? child) {
            final controller = watch(homeControllerProvider);
            return Center(
                child: controller.when(
              data: (data) => data.isEmpty
                  ? const CircularProgressIndicator()
                  : LoadMore(
                      isFinish: false,
                      onLoadMore: () async {
                        context.read(pageNumber).state++;
                        await Future.delayed(
                                const Duration(seconds: 0, milliseconds: 2000));
                        return false;
                      },
                      textBuilder: DefaultLoadMoreTextBuilder.english,
                      child: ListView.separated(
                        controller: ScrollController(
                            keepScrollOffset: false,
                            initialScrollOffset:
                                ((data.length / 20) - 1) * 1600.0),
                        itemBuilder: (c, i) => PersonItemDesign(
                          person: data[i],
                        ),
                        separatorBuilder: (c, i) => const Divider(
                          height: 10,
                        ),
                        itemCount: data.length,
                      ),
                    ),
              loading: () => const CircularProgressIndicator(),
              error: (e, i) => Text(
                e.toString(),
              ),
            ));
          },
        ),
      ),
    );
  }
}
