import 'package:flutter/material.dart';

import '../../helper/constans/theme.dart';

class FacilityItem extends StatelessWidget {
  final String text;
  const FacilityItem({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: const EdgeInsets.only(right: 6),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/icon_check_green.png',
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          Text(
            text,
            style: blackTextStyle,
          ),
        ],
      ),
    );
  }
}
