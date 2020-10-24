import 'package:base_sample/application_model/repository/http_request/http_request.dart';
import 'package:base_sample/application_model/repository/sample/items_stock/items_stock_response.dart';
import 'package:base_sample/application_model/repository/sample/util/nothing_parameter.dart';

class ItemsStockRequest extends GetRequestable<ItemsStockResponse, NothingParameter> {
  /// 通信先情報
  String hostName = 'www.mocky.io';
  String path = '/v2/5c2df3b92f00008e2f175350';
}