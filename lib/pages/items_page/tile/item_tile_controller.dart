import 'package:flutter/foundation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:base_sample/model/model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'item_tile_state.dart';

export 'item_tile_state.dart';

class ItemTileController extends StateNotifier<ItemTileState> {
  ItemTileController(
    this._read, {
      @required this.id,  /// idを持ったMap?
    }) : super(ItemTileState()) {
    /// 在庫の更新処理
    _cartControllerRemoveListener = _read(cartProvider).addListener(  /// addListener: stateが変更されるたびに実行される
        (cartState) {
        final cartItem = cartState.cartItem(stock.item);
        final cartItemQuantity = cartItem?.quantity ?? 0;
        state = state.copyWith(
          quantity: stock.quantity - cartItemQuantity,  /// 在庫更新
        );
      },
    );
  }

  final Reader _read;

  final int id;
  VoidCallback _cartControllerRemoveListener;

  /// idを元にAPIから取得した商品を取得する
  ItemStock get stock => _read(itemsProvider).state.stock(id);

  void addToCart() => _read(cartProvider).add(stock.item);

  @override
  void dispose() {
    _cartControllerRemoveListener();

    super.dispose();
  }
}