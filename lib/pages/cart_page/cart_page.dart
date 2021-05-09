import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:base_sample/model/model.dart';
import 'package:base_sample/widgets/widgets.dart';

import 'cart_header.dart';
import 'cart_tile.dart';

/// 使われなくなったら自動で破棄される
final _shouldPop = Provider.autoDispose(
    (ref) => ref.watch(cartProvider).summary.totalPrice <= 0,
);

class CartPage extends HookWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void pop() => Navigator.of(context).pop();
    /// カートから品がなくなると自動で閉じる？
    return ProviderListener(
      provider: _shouldPop,
      onChange: (context, bool shouldPop) {
        if (shouldPop) {
          pop();
        }
      },
      child: Scaffold(
        appBar: CupertinoNavigationBar( /// iOSっぽいnavigationBar
          middle: const Text('カート'),
          leading: NavigationBarButton(
            text: '閉じる',
            onPressed: pop,
          ),
        ),
        body: Column(
          children: const [
            CartHeader(),
            Expanded(child: _ListView()), /// Expanded:ListViewをColumn目一杯に配置
          ],
        ),
      ),
    );
  }
}

class _ListView extends HookWidget {
  const _ListView();
  @override
  Widget build(BuildContext context) {
    final items = useProvider(cartProvider.select((s) => s.sortedItems));
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: items.length,
      itemBuilder: (_, index) => CartTile(cartItem: items[index]),
    );
  }
}