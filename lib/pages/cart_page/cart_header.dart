import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:base_sample/model/model.dart';

class CartHeader extends HookWidget {
  const CartHeader();

  @override
  Widget build(BuildContext context) {
    final totalPrice = useProvider(
      cartProvider.state.select((s) => s.summary.totalPriceState),  /// totalPriceStateの変更のみを監視
    );
    return Container(
      height: 55,
      color: Colors.grey[300],
      child: Center(
        child: Text(
          totalPrice,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}