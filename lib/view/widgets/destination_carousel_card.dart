// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:katasik_app/helper/constans/theme.dart';
import 'package:katasik_app/view/pages/detail_destination_view.dart';
import '../../model/destination_model.dart';

class DestinationCarouselCard extends StatelessWidget {
  DestinationModel destination;
  DestinationCarouselCard({
    Key? key,
    required this.destination,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(
        () => DetailDestinaionView(
          destination: destination,
        ),
      ),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 200,
            margin: const EdgeInsets.only(
              right: defaultMargin,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(destination.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 200,
            margin: const EdgeInsets.only(
              right: defaultMargin,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0),
                  Colors.black.withOpacity(1),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 22, left: defaultMargin),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    destination.category,
                    style: blackTextStyle.copyWith(fontWeight: light),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: defaultMargin,
                      bottom: defaultMargin,
                      right: defaultMargin),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        destination.name,
                        style: whiteTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                      Text(
                        destination.address,
                        style: whiteTextStyle.copyWith(
                          fontWeight: light,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
