// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class CodeScannerPageContent extends HookConsumerWidget {
//   const CodeScannerPageContent({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // if (!ref.read(homeStateNotifierProvider).isLocationAllow) {
//     //   return const _Notice();
//     // }
//     // ref.listen(registerStampUseCaseProvider, (previous, next) {
//     //   switch (next) {
//     //   // 成功時、画面遷移
//     //     case Success():
//     //       ref
//     //           .read(homeStateNotifierProvider.notifier)
//     //           .setPage(HomePageChild.history);
//     //   // 範囲外の場合
//     //     case Error():
//     //       CodeScannerAlertDialog(context).show();
//     //     default:
//     //   }
//     // });
//     return Builder(
//       builder: (context) => Stack(
//         children: [
//           MobileScanner(
//             controller: MobileScannerController(
//               detectionSpeed: DetectionSpeed.noDuplicates,
//             ),
//             fit: BoxFit.contain,
//             onDetect: (capture) async {
//               if (capture.barcodes.isEmpty) return;

//               final rawValue = capture.barcodes.first.rawValue;
//               if (rawValue == null) return;

//               ref.read(registerStampUseCaseProvider.notifier).invoke(rawValue);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// // class _Notice extends StatelessWidget {
// //   const _Notice();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Center(
// //       child: Text(
// //         t.notice.permissionOfLocationIsNotAllow,
// //         style: context.textStyles.body.copyWith(
// //           color: context.colors.onSurface,
// //           fontSize: 18,
// //         ),
// //       ),
// //     );
// //   }
// // }
