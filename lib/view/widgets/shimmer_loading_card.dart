import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:katasik_app/view/widgets/skelton.dart';

class ShimmerLoadingCard extends StatelessWidget {
  const ShimmerLoadingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Skelton(
          height: 130,
          width: 180,
          marginBottom: 10,
        ),
        Skelton(
          height: 12,
          width: 100,
          marginBottom: 10,
        ),
        Skelton(
          height: 14,
          width: 140,
          marginBottom: 10,
        ),
        Skelton(
          height: 14,
          width: 100,
          marginBottom: 10,
        ),
        Skelton(
          height: 10,
          width: 140,
          marginBottom: 10,
        ),
        Skelton(
          height: 10,
          width: 140,
          marginBottom: 10,
        ),
      ],
    );
  }
}
