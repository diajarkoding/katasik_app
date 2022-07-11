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
      padding: const EdgeInsets.only(
        left: 10,
        bottom: 15,
      ),
      child: InkWell(
        onTap: onPressed,
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(
                Icons.radio_button_checked,
                size: 14,
              ),
            ),
            Text(
              name,
              style: greenTextStyle.copyWith(),
            ),
          ],
        ),
      ),
    );
  }
}
