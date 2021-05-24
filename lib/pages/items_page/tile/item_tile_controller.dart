import 'package:flutter/foundation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:base_sample/model/model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'item_tile_state.dart';

export 'item_tile_state.dart';

class ItemTileController extends StateNotifier<ItemTileState> {
  ItemTileController(
    this._read, {
      required this.id,  /// 名前付き引数
    }) : super(ItemTileState()) {
    /// 在庫の更新処理
    /// カート情報が更新されたら呼び出される
    _cartControllerRemoveListener = _read(cartProvider.notifier).addListener(  /// addListener: stateが変更されるたびに実行される
        (cartState) {
        final cartItem = cartState.cartItem(stock.item);  /// カート情報からidが一致する商品情報を取得
        final cartItemQuantity = cartItem?.quantity ?? 0;
        state = state.copyWith(
          quantity: stock.quantity - cartItemQuantity,  /// 在庫更新(APIから取得した在庫数 - カート情報の個数)
        );
      },
    );
  }

  final Reader _read;

  final int id;
  late final VoidCallback _cartControllerRemoveListener;

  /// idを元にAPIから取得した商品を取得する
  ItemStock get stock => _read(itemsProvider).stock(id);

  /// カートに商品を追加
  void addToCart() => _read(cartProvider.notifier).add(stock.item);

  @override
  void dispose() {
    _cartControllerRemoveListener();

    super.dispose();
  }
}
