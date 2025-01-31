import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;

  DioClient() : _dio = Dio(
          BaseOptions(
            baseUrl: "https://quiz-test-e76a3-default-rtdb.europe-west1.firebasedatabase.app",
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
            headers: 
                {
                  'Content-Type': 'application/json',
                  'Accept': 'application/json',
                },
          ),
        );

  // GET method
  Future<Response> get(String endpoint,
      {Map<String, dynamic>? queryParams}) async {
    try {
      return await _dio.get(endpoint, queryParameters: queryParams);
    } catch (e) {
      throw Exception(_handleError(e));
    }
  }

  // POST method
  Future<Response> post(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      return await _dio.post(endpoint, data: data);
    } catch (e) {
      throw Exception(_handleError(e));
    }
  }

  // PUT method
  Future<Response> put(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      return await _dio.put(endpoint, data: data);
    } catch (e) {
      throw Exception(_handleError(e));
    }
  }

  // DELETE method
  Future<Response> delete(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      return await _dio.delete(endpoint, data: data);
    } catch (e) {
      throw Exception(_handleError(e));
    }
  }

  // Error handler
  String _handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return "Connection timed out. Please try again.";
        case DioExceptionType.sendTimeout:
          return "Request sending timed out. Please try again.";
        case DioExceptionType.receiveTimeout:
          return "Response receiving timed out. Please try again.";
        case DioExceptionType.badResponse:
          return "Server responded with error code: ${error.response?.statusCode}";
        case DioExceptionType.cancel:
          return "Request to API server was cancelled.";
        case DioExceptionType.unknown:
          return "An unexpected error occurred: ${error.message}";
        default:
          return "An unknown DioException occurred.";
      }
    }
    return "Unexpected error: $error";
  }
}
