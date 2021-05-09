import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:base_sample/model/model.dart';

void main() {
  late ItemsController target;
  final item = ItemStock(
    item: Item(
      id: 1,
      title: 'test',
      price: 101,
      imageUrl: 'http://example.com',
    ),
    quantity: 1,
  );

  /// テストケースが実行される直前に毎回呼ばれる
  setUp(() {
    /// Providerの値を仮の値に変更できる
    final container = ProviderContainer(
      overrides: [
        itemsFetcher.overrideWithValue(AsyncValue.data([item])),
      ],
    );
    target = container.read(itemsProvider.notifier); /// itemsProvider内でitemsFetcherを使用できるようにした
  });

  test('ItemsController test', () async {
    final stocks = target.debugState.stocks;
    expect(stocks.length, 1);
    expect(stocks.first.quantity, 1);
  });
}