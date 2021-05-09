import 'package:base_sample/application_model/repository/http_request/responsible.dart';
import 'package:base_sample/application_model/repository/http_request/parametalizable.dart';
import 'package:base_sample/application_model/repository/http_request/request_base.dart';

abstract class Requestable extends RequestBase {

  Requestable({
    this.hostName = "",
    this.path = ""
  });

  /// 通信先情報
  String hostName;
  String path;
}

/// Getリクエストを行うクラス
class GetRequestable<R extends Responsible, P extends Parameterizable> extends Requestable {
  Future<R> get(P parameters) async {
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
      RequestBase.headers
    );

    return getResponseJson<R>();
  }
}

/// Postリクエストをクラス
class PostRequestablee<R extends Responsible, P extends Parameterizable> extends Requestable {
  Future<R> post(P parameters) async {
    await request(
      /// uri
      parameters is PathParameterizable ?
      Uri.https(hostName, path, parameters.queryParameters) : Uri.https(hostName, path),
      /// MethodType
      MethodType.post,
      /// parameters
      parameters is PathParameterizable ?
      {} : parameters.toJson(),
      /// header
      RequestBase.headers
    );

    return getResponseJson<R>();
  }
}