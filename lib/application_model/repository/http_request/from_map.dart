import 'package:base_sample/application_model/repository/sample/mocky_io/account_info/account_info_response.dart';


/**
 * objectのデコード用map
 */
final Map<Type, Function> factory = <Type, Function> {

  /// sample
  AccountInfoResponse: (Map<String, dynamic> json) =>
                          AccountInfoResponse.fromJson(json),
};