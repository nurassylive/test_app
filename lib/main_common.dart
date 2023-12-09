import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:test_app/core/app.dart';
import 'package:test_app/core/injections/injection.dart';

Future<void> main_common() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await configureDependencies();

  runZonedGuarded(() async {
    FlutterError.onError = (errorDetails) {
      if (!kDebugMode) {
        Logger().e(errorDetails, time: DateTime.now(), error: errorDetails, stackTrace: errorDetails.stack);
      }
    };
    PlatformDispatcher.instance.onError = (error, stack) {
      if (!kDebugMode) {
        Logger().e(error, time: DateTime.now(), error: error, stackTrace: stack);
      }
      return true;
    };

    runApp(const App());
  }, (error, stack) {
    Logger().e(error, time: DateTime.now(), error: error, stackTrace: stack);
  });
}
