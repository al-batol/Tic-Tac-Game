import 'package:flutter/material.dart';
import 'package:tic_tac/utils/colors.dart';

class XoContainer extends StatelessWidget {
  final String xo;
  final Color color;
  const XoContainer({Key? key, required this.xo, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.containerColor),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text(xo, style: TextStyle(color: color),),
      ),
    );
  }
}
