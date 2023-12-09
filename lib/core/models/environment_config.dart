enum Environment { dev, prod, qs }

EnvironmentConfig? env;

class EnvironmentConfig {
  final Environment? environment;
  final String? baseUrl;

  EnvironmentConfig._init({
    this.environment,
    this.baseUrl,
  });

  static void init({
    required Environment environment,
    required String? baseUrl,
  }) {
    env ??= EnvironmentConfig._init(
      environment: environment,
      baseUrl: baseUrl,
    );
  }
}
