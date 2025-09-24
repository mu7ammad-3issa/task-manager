import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:task_manager/core/constants/constants.dart';
import 'package:task_manager/core/helpers/helper_methods/shared_pref_helper.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;
  static Future<Dio> getDio() async {
    Duration timeout = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeout
        ..options.receiveTimeout = timeout;
      await addDioHeaders();
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static Future<void> addDioHeaders() async {
    final apiKey = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.anonKey,
    );
    dio?.options.headers = {
      'Content-Type': 'application/json',
      'Prefer': 'return=representation',
      'apikey': apiKey,
      'Authorization': 'Bearer $apiKey',
    };
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ),
    );
  }
}
