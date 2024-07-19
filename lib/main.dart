import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calculator/cache/cache.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheData.cacheDataInit();
  runApp(const ProviderScope(child: MyApp()));
}
