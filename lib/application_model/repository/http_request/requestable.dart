import 'dart:convert';
import 'dart:io';

import 'package:base_sample/application_model/repository/http_request/responsible.dart';
import 'package:base_sample/application_model/repository/http_request/parametalizable.dart';
import 'package:base_sample/application_model/repository/http_request/request_base.dart';

abstract class Requestable <R,P> extends RequestBase {

  /// 通信先情報
  Uri uri;
  String hostName;
  String path;
}

abstract class GetRequestable extends Requestable <Responsible, Parameterizable> {
  Future<Responsible> get(Parameterizable parameters);
}

extension getRequestable on GetRequestable {
  Future<Responsible> get(Parameterizable parameters) async {
    await request(
      /// uri
      parameters is PathParameterizable ?
        Uri.https(hostName, path, parameters.queryParameters) : Uri.https(hostName, path),
      /// MethodType
      MethodType.get,
      /// parameters
      parameters is PathParameterizable ?
        {} : parameters.toJson(),
      /// header
      {}
    );

    return getResponseJson<Responsible>();
  }
}