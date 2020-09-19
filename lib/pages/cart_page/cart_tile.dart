import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:base_sample/model/model.dart';
import 'package:base_sample/widgets/widgets.dart';

class CartTile extends HookWidget {
  CartTile({
    @required this.cartItem,
  }) : super(key: ValueKey(cartItem.item.id));

  final CartItem cartItem;
  Item get item => cartItem.item;

  static const _indent = 16.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: _indent),
          height: 96,
          child: Row(
            children: [
              ItemImage(imageUrl: item.imageUrl),
              const SizedBox(width: 8),
              _buildItemInfo(context),
              _buildButton(context)
            ],
          ),
        ),
        const Divider(indent: _indent), /// 横線
      ],
    );
  }

  Widget _buildItemInfo(BuildContext context) {
    final theme = Theme.of(context);
    return ItemInfo(
      title: item.title,
      price: item.priceWithUnit,
      info: Text(
        '数量 ${cartItem.quantity}',
        style: theme.textTheme.caption,
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return CupertinoButton(
      child: Text(
        '削除',
        style: TextStyle(
          color: Theme.of(context).errorColor,
        ),
      ),
      onPressed: () {
        context.read(cartProvider).delete(item);
      },
    );
  }
}