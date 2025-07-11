import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app.dart';
import 'core/utility/logger.dart';

Future<void> main() async {
  // const url = String.fromEnvironment('supabaseUrl');
  // const anonKey = String.fromEnvironment('anonKey');
  // await Supabase.initialize(
  //   url: url,
  //   anonKey: anonKey,
  // );
  LoggerClass.configure();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const App();
  }
}
