import 'package:flutter/material.dart';

class Skelton extends StatelessWidget {
  final double height;
  final double width;
  final double marginBottom;
  const Skelton({
    Key? key,
    this.height = 0.0,
    this.width = 0.0,
    this.marginBottom = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(bottom: marginBottom),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.04),
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
      ),
    );
  }
}
