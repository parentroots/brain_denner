import 'dart:io';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final File? imageFile; // File নাও
  final double size;
  final VoidCallback? onCameraTap;

  const ProfileCard({
    super.key,
    this.imageFile,
    this.size = 100,
    this.onCameraTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main avatar circle
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[300],
            image: imageFile != null
                ? DecorationImage(
              image: FileImage(imageFile!), // <-- এখানে FileImage ব্যবহার
              fit: BoxFit.cover,
            )
                : null,
          ),
          child: imageFile == null
              ? Icon(
            Icons.person,
            size: size * 0.6,
            color: Colors.grey[600],
          )
              : null,
        ),

        // Camera button
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: onCameraTap,
            child: Container(
              width: size * 0.3,
              height: size * 0.3,
              decoration: BoxDecoration(
                color: const Color(0xFF0A7EA4),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: size * 0.16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
