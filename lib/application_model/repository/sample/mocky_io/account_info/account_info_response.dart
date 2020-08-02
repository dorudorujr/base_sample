import 'package:base_sample/application_model/repository/http_request/responsible.dart';
import 'package:base_sample/application_model/repository/sample/mocky_io/account_info/model/account_info.dart';

class AccountInfoResponse extends Responsible {
  AccountInfoResponse({
    this.accountInfo
  });

  /// デコード用 factory コンストラクタ
  factory AccountInfoResponse.fromJson(Map<String, dynamic> json) {
    return AccountInfoResponse(
      accountInfo: AccountInfo.fromJson(json['accountInfo'] as Map<String, dynamic>)
    );
  }

  final AccountInfo accountInfo;
}