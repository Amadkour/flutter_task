
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_controller.dart';

final HomeControllerProvider=ChangeNotifierProvider<HomeController>((ref)=>HomeController());