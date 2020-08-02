import 'package:base_sample/application_model/repository/http_request/requestable.dart';
import 'package:base_sample/application_model/repository/sample/mocky_io/account_info/account_info_response.dart';
import 'package:base_sample/application_model/repository/sample/util/nothing_parameter.dart';

class AccountInfoRequest extends GetRequestable<AccountInfoResponse, NothingParameter> {
  /// 通信先情報
  String hostName = 'run.mocky.io';
  String path = '/v3/fb72a27c-4fdd-49c8-8fd6-8b4ad92ac12a';
}

