import 'package:flutter/cupertino.dart';

class NavigationBarButton extends StatelessWidget {
  /// Initializer Lists: コロンに続けてフィールドの初期化処理を記述
  NavigationBarButton({
    Key? key,
    this.onPressed,
    required String text,
  })  : child = Text(text),
        super(key: key);

  final Widget child;
  /// VoidCallback: 引数がなく、データを返さない
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    /// CupertinoButton: ios固有のbutton
    return CupertinoButton(
      child: child,
      onPressed: onPressed,
      padding: EdgeInsets.zero,
    );
  }
}