import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../uitls/constants/appColors/app_colors.dart';

class ColumnAppTextWithDot extends StatelessWidget {
  final String value1;       // required
  final String? value2;      // optional
  final String? value3;      // optional

  final double fontSize=30;
  final Color valueColor;
  final FontWeight valueWeight;
  final int? maxLines;
  final TextOverflow overflow;

  const ColumnAppTextWithDot({
    super.key,
    required this.value1,
    this.value2,
    this.value3,
    this.valueColor = AppColors.white,
    this.valueWeight = FontWeight.normal,
    this.maxLines,
    this.overflow = TextOverflow.visible,
  });

  @override
  Widget build(BuildContext context) {
    // build a list of non-null values
    final values = <String>[
      value1,
      if (value2 != null) value2!,
      if (value3 != null) value3!,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: values.map((text) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '•',
              style: TextStyle(
                fontSize: 30,
                color: valueColor,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                text,
                maxLines: maxLines,
                overflow: overflow,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: valueWeight,
                  color: valueColor,
                ),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
