import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:base_sample/model/model.dart';

part 'items_state.freezed.dart';

/// メソッドを定義したい時はimplements
@freezed
abstract class ItemsState implements _$ItemsState {
  factory ItemsState({
    @Default(<ItemStock>[]) List<ItemStock> stocks,
    @Default(true) bool isLoading,
  }) = _ItemsState; /// わざわざプロパティを記述しなくて済む？

  ItemsState._();

  @late
  Map<int, ItemStock> get _map => Map.fromEntries(
    stocks.map((s) => MapEntry(s.item.id, s)),
  );

  ItemStock stock(int id) => _map[id];
}