// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
//
// enum ApiMethodType {
//   post,
//   get,
// }
//
// abstract class ApiStrategy<R, E> {
//   abstract final ApiMethodType methodType;
//   abstract final String methodName;
//   abstract final dynamic data;
//
//   @protected
//   void handleResponseError(Response response);
//
//   void onError(E e);
// }
//
// class AuthRegisterParams {
//   final String email;
//   final String name;
//   final String password;
//
//   AuthRegisterParams({
//     required this.email,
//     required this.name,
//     required this.password,
//   });
// }
//
// class AuthRegisterStrategy extends ApiStrategy<AuthRegisterParams> {
//   AuthRegisterStrategy({
//     required
//   });
//
//   @override
//   final data => throw UnimplementedError();
//
//   @override
//   // TODO: implement methodName
//   String get methodName => throw UnimplementedError();
//
//   @override
//   // TODO: implement methodType
//   ApiMethodType get methodType => throw UnimplementedError();
//
//   @override
//   void onError(e) {
//     // TODO: implement onError
//   }
//
//   @override
//   void handleReponseError(Response response) {
//     // TODO: implement onResponseError
//   }
//
// }