import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/auth/auth_notifier.dart';
import 'package:selfdevers/repositories/token_repository.dart';

const _LOCAL_URL = 'http://127.0.0.1:3000/';
const _NETWORK_URL = 'http://194.58.107.53:3000/';

const BASE_URL = _LOCAL_URL;

final apiProvider = Provider<Api>((ref) {
  return Api._(ref);
});

class Api {
  final _dio = Dio(BaseOptions(
    baseUrl: BASE_URL,
  ));

  Api._(Ref ref) {
    _dio.interceptors
      ..add(QueuedInterceptor())
      ..add(InterceptorsWrapper(onRequest: (reqOptions, handler) async {
        final accessToken = await TokenRepository().loadAccessToken();

        if (accessToken == null) {
          await ref.read(authStateProvider.notifier).logout();
        } else {
          print('Перед добавлением accessToken в req');
          print('reqOptions.headers: ${reqOptions.headers}');
          reqOptions.headers["Authorization"] = "Bearer $accessToken";
          print('После добавления accessToken в req');
          print('reqOptions.headers: ${reqOptions.headers}');
        }
        handler.next(reqOptions);
      }));
  }

  Future<Response<dynamic>> post(String method,
      [dynamic data, CancelToken? cancelToken]) async {
    return _dio.post(method, data: data, cancelToken: cancelToken);
  }

  Future<Response<dynamic>> get(String method,
      [dynamic data, CancelToken? cancelToken]) async {
    return _dio.get(method);
  }

  Future<Response<dynamic>> delete(String method,
      [dynamic data, CancelToken? cancelToken]) async {
    return _dio.delete(method, data: data, cancelToken: cancelToken);
  }

  // Future<CancelToken> call<T, R, E>(
  //     ApiStrategy<T, R> apiMethodStrategy,
  //     void Function(R result) onSuccess,
  //     void Function(E error) onError,
  // ) async {
  //   try {
  //     final cancelToken = CancelToken();
  //
  //     switch (apiMethodStrategy.methodType) {
  //       case ApiMethodType.post:
  //         final response = await _dio.post<R>(
  //           apiMethodStrategy.methodName,
  //           data: apiMethodStrategy.data,
  //           cancelToken: cancelToken,
  //         );
  //         onSuccess(response.data!);
  //         break;
  //       case ApiMethodType.get:
  //         final response = await _dio.get<R>(
  //           apiMethodStrategy.methodName,
  //           cancelToken: cancelToken,
  //         );
  //         onSuccess(response.data!);
  //         break;
  //     }
  //
  //     return cancelToken;
  //   } on DioError catch (e) {
  //     // TODO: Выводить на экран сообщение с ошибкой.
  //     // Например, если нет интернета, то вывести
  //     // Но не выводить ошибку, если CancelToken был специально
  //     // cancel'нут для оптимизации
  //     // if (e.type == DioErrorType.)
  //     print(e);
  //     rethrow;
  //   }
  // }
}
