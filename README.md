# base_sample
flutterのbase repository(サンプルなども含む)
※個人学習用

## 内容概要
### アーキテクチャ
- 以下のパッケージを組み合わせたパターン
    - [Riverpod](https://riverpod.dev/)の[hooks_riverpod](https://pub.dev/packages/hooks_riverpod)
        - [flutter_hooks](https://pub.dev/packages/flutter_hooks)は`useProvider()`のためだけに利用
    - [state_notifier]()
    - [freezed](https://pub.dev/packages/freezed)
JSON APIは http://www.mocky.io で用意