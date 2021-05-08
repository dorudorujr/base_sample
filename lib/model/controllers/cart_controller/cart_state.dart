import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:base_sample/model/model.dart';

part 'cart_state.freezed.dart';

@freezed
abstract class CartState implements _$CartState {
  factory CartState({
    @Default(<int, CartItem>{}) Map<int, CartItem> itemMap,
  }) = _CartState;

  CartState._();

  /// idでソートしたCartItemのListを返す
  //@late
  /// TODO: late付与
  List<CartItem> get sortedItems =>
    itemMap.values.toList()..sort((a, b) => a.item.id.compareTo(b.item.id));

  //@late
  /// TODO: late付与
  CartSummary get summary => CartSummary(
    ///fold: 与えられた関数を使って要素を単一の値に圧縮
    quantity: itemMap.values.fold<int>(
      0,  /// 初期値
        (sum, e) => sum + e.quantity, ///(curr, next)
    ),
    totalPrice: itemMap.values.fold<int>(
      0,
        (sum, e) => sum + e.item.price * e.quantity,
    ),
  );

  /// 与えられたitemと一致するものをitemMapから取得する
  CartItem cartItem(Item item) => sortedItems.firstWhere(
      (cartItem) => cartItem.item == item,
    orElse: () => null,
  );
}

@freezed
abstract class CartSummary with _$CartSummary {
  factory CartSummary({
    @Default(0) int quantity,
    @Default(0) int totalPrice,
  }) = _CartSummary;

  //@late
  /// TODO: late付与
  String get state => 'カート($quantity)';
  //@late
  /// TODO: late付与
  String get totalPriceState => '合計金額 $totalPrice円+税';
}