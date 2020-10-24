import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';
import 'package:base_sample/application_model/repository/sample/items_stock/items_stock_request.dart';
import 'package:base_sample/application_model/repository/sample/util/nothing_parameter.dart';

import 'model.dart';

//final _client = Client();

/// monoさんのサンプル
// ignore: top_level_function_literal_block
//final itemsFetcher = FutureProvider((ref) async {
//  final result = await _client.get(
//    'https://www.mocky.io/v2/5c2df3b92f00008e2f175350',
//  );
//  final json =
//    (await jsonDecode(result.body) as List).cast<Map<String, dynamic>>();
//  final list = json.map(ItemStock.fromJson).toList();
//  return list;
//});

/// Futureを返すProvider
// ignore: top_level_function_literal_block
final itemsFetcher = FutureProvider((ref) async {
  final repository = ItemsStockRequest();
  final itemsStock = await repository.get(NothingParameter());
  return itemsStock.itemStock;
});