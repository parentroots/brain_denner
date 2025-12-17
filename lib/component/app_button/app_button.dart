import 'package:brain_denner/uitls/constants/appColors/app_colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double height;
  final double borderRadius;
  final Gradient? gradient;
  final Color? color;
  final Color? textColor;
  final IconData? icon;
  final double fontSize;
  final FontWeight fontWeight;

  const AppButton({
    required this.text,
    required this.onPressed,
    this.width,
    this.height = 60,
    this.borderRadius = 90,
    this.gradient,
    this.color,
    this.textColor,
    this.icon,
    this.fontSize = 16,
    this.fontWeight = FontWeight.bold,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Widget child = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[
          Icon(icon, color: textColor ?? Colors.white),
          const SizedBox(width: 8),
        ],
        Text(
          text,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ],
    );

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFFCA112),
            Color(0xFFFE8005),



          ],
        ),
        color: gradient == null ? (color ?? Colors.blue) : null,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: onPressed,
          child: Center(child: child),
        ),
      ),
    );
  }
}
