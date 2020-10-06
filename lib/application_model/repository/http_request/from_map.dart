import 'package:base_sample/application_model/repository/sample/mocky_io/account_info/account_info_response.dart';
import 'package:base_sample/application_model/repository/sample/items_stock/items_stock_response.dart';

/**
 * objectのデコード用map
 */
final Map<Type, Function> factory = <Type, Function> {

  /// sample
  AccountInfoResponse: (Map<String, dynamic> json) =>
                          AccountInfoResponse.fromJson(json),
  /// アーキテクチャを使用したsample
  ItemsStockResponse: (Map<String, dynamic> json) =>
                          ItemsStockResponse.fromJson(json),
};