import 'package:flutter/cupertino.dart';
import 'package:flutter_task/modules/home/presentation/page/home_screen.dart';
import 'package:flutter_task/modules/profile/presentation/page/profile_screen.dart';

import '../widget/full_screen_image.dart';

class Routes {
  static const String home = '/home';
  static const String profile = '/profile';
  static const String fullScreenImage = '/fullScreenImage';

  ///---------------------Screens----------------///
  static final Map<String, Widget Function(BuildContext)> pageRoutes = {
    home: (context) => const HomeScreen(),
    fullScreenImage: (context) => FullScreenImage(),
    profile: (context) => ProfileScreen(),
  };
}
