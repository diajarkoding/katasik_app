import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/viewmodel/destination_viewmodel.dart';
import '../../helper/constans/theme.dart';

class DestinationCard extends StatelessWidget {
  final Function() onTap;
  final bool isDestinaionView;
  final double distance;
  final String imageUrl;
  final String name;
  final String address;
  final String category;

  DestinationCard({
    Key? key,
    this.isDestinaionView = false,
    required this.onTap,
    required this.distance,
    required this.imageUrl,
    required this.name,
    required this.address,
    required this.category,
  }) : super(key: key);

  final controller = Get.put(DestinationViewModel());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
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
                  category,
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
                    'Jarak ${distance.toStringAsFixed(0)} Km',
                    style: greenTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              name,
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ),
          Text(
            address,
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
