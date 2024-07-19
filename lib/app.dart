import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:calculator/view/calculator_view.dart';

import 'utils/themes/app_theme.dart';
import 'viewmodel/theme_provider.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        builder: (context, widget) {
          final mediaQueryData = MediaQuery.of(context);
          final scaledMediaQueryData = mediaQueryData.copyWith(
            textScaler: TextScaler.noScaling,
          );
          return MediaQuery(
            data: scaledMediaQueryData,
            child: widget!,
          );
        },
        theme:
            theme == ThemeEnum.dark ? AppTheme.lightTheme : AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        home: const CalculatorView(),
      ),
    );
  }
}
