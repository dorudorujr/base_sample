import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:base_sample/application_model/repository/http_request/responsible.dart';
import 'package:base_sample/application_model/repository/http_request/from_map.dart';
import 'package:base_sample/application_model/repository/http_request/Error/custom_error.dart';

enum MethodType {
  get,
  post,
  put,
  delete,
}

class RequestBase {
  /// http通信によって取得したresponse
  /// TODO: lateじゃない方法を探る
  late http.Response _response;
  /// http通信のtimeout
  final Duration _timeout = Duration(seconds: 20);
  /// header
  static Map<String, String> headers = {'Content-Type': 'application/json'};

  /**
   * request(http通信)を行いresponseを取得する
   */
  Future<void> request(
    Uri uri,
    MethodType methodType,
    Map<String, dynamic> parameters,
    Map<String, String> headers
    ) async {
    try {
      switch (methodType) {
        /// getリクエスト
        case MethodType.get:
          _response = await http.get(
            uri,
            headers: headers,
          ).timeout(_timeout);
          break;

        /// postリクエスト
        case MethodType.post:
          _response = await http.post(
            uri,
            headers: headers,
            body: parameters
          ).timeout(_timeout);
          break;

        /// putリクエスト
        case MethodType.put:
          _response = await http.put(
            uri,
            headers: headers,
            body: parameters
          ).timeout(_timeout);
          break;

        /// deleteリクエスト
        case MethodType.delete:
          _response = await http.delete(
            uri,
            headers: headers,
          ).timeout(_timeout);
          break;
      }
    } catch (e) {
      throw e;
    }
  }

  /**
   * レスポンス形式がJsonの場合、Entityを指定してObjectMapperでマッピングまで行う
   */
  T getResponseJson<T extends Responsible>() {
    final decodeBody = utf8.decode(_response.bodyBytes);
    final dynamic responseBody = json.decode(decodeBody);
    if (factory[T] == null) { throw CustomError('factoryへの定義漏れ'); }
    final responseObject = factory[T]!(responseBody) as T;   /// ResponsibleのfromJson呼び出し

    /// TODO: factory[T]!(responseBody)でマッピングできなかった時の考慮追加
    return responseObject;
  }
}