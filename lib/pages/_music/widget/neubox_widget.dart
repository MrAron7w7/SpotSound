import 'package:flutter/material.dart';
import 'package:spotsound/themes/app_color.dart';

class NeuBoxWidget extends StatelessWidget {
  final Widget? child;
  const NeuBoxWidget({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          const BoxShadow(
            color: Color(0xff95B9F3),
            blurRadius: 15,
            offset: Offset(4, 4),
          ),
          BoxShadow(
            color: Colors.grey.shade500,
            blurRadius: 15,
            offset: const Offset(-4, -4),
          ),
        ],
      ),
      child: child,
    );
  }
}
