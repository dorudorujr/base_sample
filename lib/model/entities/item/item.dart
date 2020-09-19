import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'item.freezed.dart';
part 'item.g.dart';   /// json変換処理追加

/// 各商品情報
/// メソッドを定義しなくてもいい時はwith
@freezed
abstract class Item with _$Item {
  factory Item({
    @required int id,
    @required int price,
    @required String title,
    @required String imageUrl,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  @late /// 遅延初期化(freezedの機能)。一度使った値を自動でキャッシュ
  String get priceWithUnit => '$price円+税';
}