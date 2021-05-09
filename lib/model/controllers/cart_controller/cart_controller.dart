import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:base_sample/model/model.dart';

import 'cart_state.dart';

export 'cart_state.dart';

final cartProvider = StateNotifierProvider<CartController, CartState>(
      (ref) => CartController(),
);

class CartController extends StateNotifier<CartState> {
  CartController() : super(CartState());

  /// カートに商品を追加
  /// カートに引数で渡されたitemが存在しない場合はCartItemを作成してincreased
  void add(Item item) {
    state = state.copyWith(
      /// ...: スプレッド演算子
      /// map: { key1 : value1, key2 : value2 }
      itemMap: {
        ...state.itemMap,
        item.id: (state.itemMap[item.id] ??
          CartItem(
            item: item,
            quantity: 0,
          ))
          .increased(),
      },
    );
  }

  /// カートの商品を削除
  void delete(Item item) {
    state = state.copyWith(
      itemMap: {
        ...state.itemMap,
        item.id: state.itemMap[item.id]!.decreased(),
      }..removeWhere((key, value) => value.quantity <= 0),
    );
  }
}