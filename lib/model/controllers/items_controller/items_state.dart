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

  /// late: 一度使った値を自動でキャッシュしてくれる(immutableなクラスなので本来は値を保持できない)
  /// stocksからidを元にMapを作成する
  late final Map<int, ItemStock> _map = Map.fromEntries(
    stocks.map((s) => MapEntry(s.item.id, s)),
  );

  /// _mapメソッドを使用してstocksからidを用いてItemStockを取得する
  ItemStock stock(int id) => _map[id]!;
}