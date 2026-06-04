class AppConfig {
  AppConfig._();

  static const String appName = 'RWNomad';

  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://www.rwnomad.com/api',
  );

  static const int pageSize = 20;
  static const int connectTimeout = 15000;
  static const int receiveTimeout = 15000;
}
