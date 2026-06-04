class ApiException implements Exception {
  final String message;
  final int? statusCode;

  const ApiException({required this.message, this.statusCode});

  factory ApiException.fromDioException(dynamic error) {
    // Try to extract error detail from Dio exception
    if (error is Map && error.containsKey('detail')) {
      return ApiException(
        message: error['detail']?.toString() ?? 'Unknown error',
        statusCode: error['status'] as int?,
      );
    }
    return const ApiException(message: 'Network error');
  }

  factory ApiException.networkError() =>
      const ApiException(message: 'Network connection failed');

  factory ApiException.unauthorized() =>
      const ApiException(message: 'Session expired, please login again',
          statusCode: 401);

  factory ApiException.serverError() =>
      const ApiException(message: 'Server error, please try again later',
          statusCode: 500);

  @override
  String toString() => message;
}
