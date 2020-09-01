import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import 'package:base_sample/model/model.dart';

import 'items_state.dart';

export 'items_state.dart';

final itemsProvider = StateNotifierProvider((ref) => ItemsController(ref.read));

class ItemsController extends StateNotifier<ItemsState> {
  ItemsController(this._read) : super(ItemsState()) {
    _load();
  }

  final Reader _read;

  /// controller生成時に実行される、itemをapiを使って取得するメソッド
  Future<void> _load() async {
    state = state.copyWith(
      stocks: await _read(itemsFetcher.future),
      isLoading: false,
    );
  }
}