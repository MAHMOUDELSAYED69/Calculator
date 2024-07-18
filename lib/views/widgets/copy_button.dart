
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants/colors.dart';
import '../../viewmodel/calculator_provider.dart';

class CopyResultButton extends ConsumerWidget {
  const CopyResultButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final copyText = ref.watch(calculatorProvider.notifier);
    return Padding(
      padding: const EdgeInsets.all(4),
      child: InkWell(
        onTap: () => copyText.copyText(),
        child: Container(
            height: 50.h,
            margin: const EdgeInsets.all(4),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ColorManager.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.copy,
              size: 28.sp,
            )),
      ),
    );
  }
}
