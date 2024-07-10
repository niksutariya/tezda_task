
import 'package:flutter/material.dart';

import '../utils/size_utils.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color? buttonColor;
  final Color? textColor;
  final Color? borderColor;
  final double? height;
  final double? width;
  final double? fontSize;
  final double? radius;
  final FontWeight? fontWeight;

  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    this.buttonColor,
    this.width,
    this.textColor,
    this.borderColor,
    this.height,
    this.fontSize,
    this.fontWeight, this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: () {},
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor ?? Colors.transparent,
            style: BorderStyle.solid,
            width: 1.0,
          ),
          color: buttonColor,
          borderRadius: BorderRadius.circular(
            radius ?? SizeUtils.horizontalBlockSize * 10,
          ),
        ),
        height: height ?? 50,
        width: width ?? SizeUtils.horizontalBlockSize * 100,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: textColor,
              fontSize:fontSize ??SizeUtils.fSize_17(),
              fontWeight: fontWeight ?? FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
