import 'package:dio/dio.dart';
import 'package:pet_finder_app_task/core/constants/api_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      headers: {
        'x-api-key': ApiConstants.apiKey,
        'Content-Type': 'application/json',
      },
      validateStatus: (status) {
        return status != null && status >= 200 && status < 300;
      },
    ),
  );

  ApiService() {
    dio.interceptors.add(PrettyDioLogger());
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: true,
        filter: (options, args) {
          // don't print requests with uris containing '/posts'
          if (options.path.contains('/posts')) {
            return false;
          }
          // don't print responses with unit8 list data
          return !args.isResponse || !args.hasUint8ListData;
        },
      ),
    );
  }

  Future<Response> getRequest({required String endpoint}) async {
    final response = await dio.get(endpoint);
    return response;
  }

  Future<Response> postRequest({
    required String endpoint,
    required Map<String, dynamic> data,
  }) async {
    final response = await dio.post(endpoint, data: data);
    return response;
  }

  Future<Response> updateRequest({
    required String endpoint,
    required Map<String, dynamic> data,
  }) async {
    final response = await dio.patch(endpoint, data: data);
    return response;
  }

  Future<Response> deleteRequest({required String endpoint}) async {
    final response = await dio.delete(endpoint);
    return response;
  }
}
