import 'package:flutter/material.dart';
import 'package:katasik_app/helper/constans/theme.dart';
import 'package:katasik_app/view/widgets/skelton.dart';

class ShimmerLoadingCarouselCard extends StatelessWidget {
  const ShimmerLoadingCarouselCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: 200,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.03),
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: defaultMargin, left: defaultMargin),
            child: Skelton(
              width: 115,
              height: 26,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                bottom: defaultMargin, left: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Skelton(
                  width: 200,
                  height: 16,
                  marginBottom: 10,
                ),
                Skelton(
                  width: 180,
                  height: 10,
                  marginBottom: 10,
                ),
                Skelton(
                  width: 160,
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
