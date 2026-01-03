import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget profileImageShimmer() {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade100,
    highlightColor: Colors.grey.shade200,
    child: Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
      ),
    ),
  );
}