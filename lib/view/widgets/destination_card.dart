import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:katasik_app/model/destination_model.dart';
import 'package:katasik_app/view/pages/detail_destination_view.dart';

import '../../helper/constans/theme.dart';

class DestinationCard extends StatelessWidget {
  final DestinationModel destination;
  final bool isDestinaionView;
  // final String text;

  const DestinationCard({
    Key? key,
    this.isDestinaionView = false,
    // this.text = 'Jarak 0 Km',
    required this.destination,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(DistanceDestinationViewModel());
    return InkWell(
      onTap: () => Get.to(
        () => DetailDestinaionView(
          destination: destination,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(destination.image),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                margin: const EdgeInsets.only(
                  left: 10,
                  bottom: 10,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 11,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  destination.category,
                  style: blackTextStyle.copyWith(
                    fontSize: 11,
                  ),
                ),
              ),
            ),
          ),
          isDestinaionView
              ? const SizedBox(
                  height: 10,
                )
              : Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 5,
                  ),
                  child: Text(
                    'Jarak ${destination.distance.toStringAsFixed(0)} Km',
                    style: greenTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              destination.name,
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ),
          Text(
            destination.address,
            style: blackTextStyle.copyWith(
              fontSize: 12,
              fontWeight: reguler,
            ),
          ),
        ],
      ),
    );
  }
}
