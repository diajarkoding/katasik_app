import 'package:flutter/material.dart';

class PhotosItem extends StatelessWidget {
  final String imageUrl;
  final Function() onPressed;
  const PhotosItem({required this.imageUrl, Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 150,
        height: 120,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    );
  }
}
