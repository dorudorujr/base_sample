import 'package:base_sample/application_model/repository/http_request/http_request.dart';
import 'package:base_sample/model/entities/entities.dart';

class ItemsStockResponse extends Responsible {
  ItemsStockResponse({
    this.itemStock
  });

  factory ItemsStockResponse.fromJson(List<dynamic> json) {
    return ItemsStockResponse(
      itemStock: (json as List).cast<Map<String, dynamic>>().map(ItemStock.fromJson).toList()
    );
  }

  final List<ItemStock> itemStock;
}