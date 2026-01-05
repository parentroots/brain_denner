import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final VoidCallback? onSuffixTap;
  final VoidCallback? onPrefixTap;
  final Color? hintColor;
  final double? hintSize;
  final int maxLine;

  const AppTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.maxLine = 1,
    this.obscureText = false,
    this.suffixIcon,
    this.onSuffixTap,
    this.prefixIcon,
    this.onPrefixTap,
    this.hintColor = const Color(0xff8E8E8E),
    this.hintSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 60,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF00243F),
            Color(0xFF082A45),
          ],
        ),
      ),
      child: TextField(
        controller: controller,
        maxLines: maxLine,
        obscureText: obscureText,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: hintColor,
            fontSize: hintSize,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 18,
          ),

          // 🔹 Prefix Icon
          prefixIcon: prefixIcon != null
              ? GestureDetector(
            onTap: onPrefixTap,
            child: Padding(
              padding: EdgeInsets.all(12.r),
              child: Icon(
                prefixIcon,
                color: const Color(0xFF00D4FF),
                size: 20,
              ),
            ),
          )
              : null,

          // 🔹 Suffix Icon
          suffixIcon: suffixIcon != null
              ? GestureDetector(
            onTap: onSuffixTap,
            child: Padding(
              padding: EdgeInsets.all(12.r),
              child: Icon(
                suffixIcon,
                color: const Color(0xff8E8E8E),
                size: 20,
              ),
            ),
          )
              : null,
        ),
      ),
    );
  }
}
