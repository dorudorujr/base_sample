import 'package:flutter/widgets.dart';

class ItemImage extends StatelessWidget {
  const ItemImage({
    Key key,
    this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,  /// 画面サイズに合わせて画像が全部表示されるギリギリの大きさまで拡大する
    );
  }
}