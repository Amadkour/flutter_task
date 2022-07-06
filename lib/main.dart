import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task/core/widget/full_screen_image.dart';
import 'core/constant/routes.dart';
import 'modules/home/presentation/page/home_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Popular Persons',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.home,
      routes:Routes.pageRoutes,
      home: const HomeScreen(),
    );
  }
}
