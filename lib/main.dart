import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task/core/constant/them.dart';
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
      theme:appTheme,
      initialRoute: Routes.home,
      routes:Routes.pageRoutes,

      home:  HomeScreen(),
    );
  }
}
