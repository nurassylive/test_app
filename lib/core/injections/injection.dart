// Package imports:
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:test_app/core/injections/injection.config.dart';
import 'package:test_app/core/utils/constants.dart';

final bool testEnv = Platform.environment.containsKey('FLUTTER_TEST');

// class EnvironmentFilterExtended extends EnvironmentFilter {
//   EnvironmentFilterExtended() : super(const {});

//   @override
//   bool canRegister(Set<String> depEnvironments) {
//     return true;
//   }
// }

@injectableInit
Future<void> configureDependencies() async => getIt.init();
