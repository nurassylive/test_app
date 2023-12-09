import 'package:test_app/core/models/environment_config.dart';
import 'package:test_app/main_common.dart';

Future<void> main() async {
  EnvironmentConfig.init(
    environment: Environment.dev,
    baseUrl: 'http://45.10.110.181:8080',
  );
  await main_common();
}
