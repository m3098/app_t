import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:test_app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  const App app = App();
  runApp(app);
}
