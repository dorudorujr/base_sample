class AccountInfo {

  AccountInfo({
    this.accountId,
    this.mailAddress,
    this.lastName,
    this.firstName,
    this.statusName
  });

  /// デコード用 factory コンストラクタ
  factory AccountInfo.fromJson(Map<String, dynamic> json) {
    return AccountInfo(
      accountId: json['accountId'] as int,
      mailAddress: json['mailAddress'] as String,
      lastName: json['lastName'] as String,
      firstName: json['firstName'] as String,
      statusName: json['statusName'] as String
    );
  }

  final int accountId;
  final String mailAddress;
  final String lastName;
  final String firstName;
  final String statusName;
}
