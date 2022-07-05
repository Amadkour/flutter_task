
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'profile_controller.dart';

final ProfileControllerProvider=ChangeNotifierProvider< ProfileController>((ref)=> ProfileController());