import 'package:flutter/material.dart';

class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1000),
          color: Colors.white,
          border: Border.all(width: 2, color: Colors.red)),
      child: const Center(
        child: Icon(
          Icons.rocket_launch_rounded,
          color: Colors.red,
        ),
      ),
    );
  }
}
