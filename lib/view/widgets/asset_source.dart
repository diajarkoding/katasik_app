import 'package:flutter/material.dart';

import '../../helper/constans/theme.dart';

class AssetSource extends StatelessWidget {
  final String name;
  final Function() onPressed;
  const AssetSource({
    Key? key,
    required this.name,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 5),
            child: Icon(
              Icons.radio_button_checked,
              size: 15,
            ),
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(
              name,
              style: greenTextStyle.copyWith(
                fontWeight: semiBold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
