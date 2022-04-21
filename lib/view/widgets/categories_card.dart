import 'package:flutter/material.dart';

import '../../helper/constans/theme.dart';

class CategoriesCard extends StatelessWidget {
  final String image;
  final String title;
  const CategoriesCard({Key? key, required this.image, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: greyColor, width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 30,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
              ),
            ),
          ),
          Text(
            title,
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
        ],
      ),
    );
  }
}
