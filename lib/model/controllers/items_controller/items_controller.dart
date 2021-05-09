import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import 'package:base_sample/model/model.dart';

import 'items_state.dart';

export 'items_state.dart';

/// APIから商品情報を取得する
final itemsProvider = StateNotifierProvider<ItemsController, ItemsState>(
      (ref) => ItemsController(ref.read),
);

/// APIから商品情報を取得するController
class ItemsController extends StateNotifier<ItemsState> {
  ItemsController(this._read) : super(ItemsState()) {
    _load();
  }

  final Reader _read;

  Future<void> _load() async {
    state = state.copyWith(
      stocks: await _read(itemsFetcher.future),
      isLoading: false,
    );
  }
}