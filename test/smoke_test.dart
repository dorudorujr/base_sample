// import 'package:flutter_test/flutter_test.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:image_test_utils/image_test_utils.dart';
// import 'package:base_sample/app.dart';
// import 'package:base_sample/model/model.dart';
//
// import 'helper/dummy_items.dart';
//
// void main() {
//   testWidgets('Smoke test', (tester) async {
//     /// provideMockedNetworkImages: imageのテスト
//     await provideMockedNetworkImages(() async {
//       await tester.pumpWidget(
//         ProviderScope(
//           overrides: [
//             itemsFetcher.overrideWithValue(
//               AsyncValue.data(dummyItems),
//             ),
//           ],
//           child: const App(),
//         ),
//       );
//       expect(find.text('商品リスト'), findsOneWidget); /// widgetが存在するか確認
//       expect(find.text('(　´･‿･｀)'), findsNothing);  /// widgetが存在しないことを確認
//
//       await tester.pumpAndSettle(); /// widgetの描画更新が終わるまで待つ
//
//       expect(find.text('カート(0)'), findsOneWidget);
//       expect(find.text('test1'), findsOneWidget);
//       expect(find.text('追加'), findsNWidgets(2));
//
//       // Press 追加 button
//       await tester.tap(find.text('追加').first);
//       await tester.pump();   /// pumpして状態を更新させる
//
//       expect(find.text('カート(1)'), findsOneWidget);
//
//       // Open カート screen
//       await tester.tap(find.text('カート(1)'));
//       await tester.pumpAndSettle();
//
//       // Close カート screen
//       await tester.tap(find.text('閉じる'));
//       await tester.pumpAndSettle();
//
//       expect(find.text('商品リスト'), findsOneWidget);
//
//       // Open カート screen
//       await tester.tap(find.text('カート(1)'));
//       await tester.pumpAndSettle();
//
//       expect(find.text('カート'), findsOneWidget);
//       expect(find.text('削除'), findsOneWidget);
//
//       // Press 削除 button
//       await tester.tap(find.text('削除'));
//       await tester.pump();
//
//       expect(find.text('削除'), findsNothing);
//
//       await tester.pumpAndSettle();
//
//       // カート screen closed automatically by cart cleared
//       expect(find.text('商品リスト'), findsOneWidget);
//     });
//   });
// }