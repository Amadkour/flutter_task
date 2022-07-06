import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controller/home_controller.dart';
import '../../controller/state.dart';
import '../widget/person_item_design.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  build(BuildContext context, watch) {
    HomeController controller = watch(HomeControllerProvider);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.2,
          title: const Text(
            'Populars',
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: controller.persons.isEmpty
                ? const CircularProgressIndicator()
                : ListView.separated(
                    itemBuilder: (c, i) => PersonItemDesign(
                          person: controller!.persons[i]!,
                        ),
                    separatorBuilder: (c, i) => const Divider(),
                    itemCount: controller.persons.length),
          ),
        ));
  }
}
