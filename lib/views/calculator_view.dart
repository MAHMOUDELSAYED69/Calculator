import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:calculator/utils/constants/colors.dart';
import 'package:calculator/utils/extentions/extentions.dart';

import '../viewmodel/calculator_provider.dart';
import '../viewmodel/theme_provider.dart';
import 'widgets/calculator_button.dart';
import 'widgets/copy_button.dart';

class CalculatorView extends ConsumerWidget {
  const CalculatorView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calculator = ref.watch(calculatorProvider);
    final theme = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        actions: [
          Switch(
            value: theme == ThemeEnum.dark,
            onChanged: (_) => ref.read(themeProvider.notifier).toggleTheme(),
          ),
          const SizedBox(width: 15)
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(calculator.expression,
                      maxLines: 2,
                      style: context.textTheme.bodyMedium?.copyWith(
                          color: ColorManager.lightGrey, fontSize: 24.sp)),
                  const SizedBox(height: 10),
                  Text(
                    calculator.result,
                    maxLines: 2,
                    style: context.textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            height: 20,
            color: ColorManager.lightGrey,
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                buildButtonRow(context, ref, ['C', 'DEL', '+/-', '%']),
                buildButtonRow(context, ref, ['(', ')', '/', 'x']),
                buildButtonRow(context, ref, ['7', '8', '9', '-']),
                buildButtonRow(context, ref, ['4', '5', '6', '+']),
                buildButtonRow(context, ref, ['1', '2', '3', '=']),
                const Row(
                  children: [
                    Expanded(flex: 2, child: CalculatorButton(text: '0')),
                    Expanded(child: CalculatorButton(text: '.')),
                    Expanded(child: CopyResultButton()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row buildButtonRow(BuildContext context, WidgetRef ref, List<String> texts) {
    return Row(
      children: texts.map((text) {
        return Expanded(
          child: CalculatorButton(text: text),
        );
      }).toList(),
    );
  }
}
