import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:katasik_app/helper/routes/route_name.dart';

import '../../helper/constans/theme.dart';

class DestinationCard extends StatelessWidget {
  final bool isDestinaionView;
  const DestinationCard({
    Key? key,
    this.isDestinaionView = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(
        Routes.detailDestinationView,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // width: 150,
            height: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: NetworkImage(
                    'https://lh5.googleusercontent.com/p/AF1QipNXQdCCsvauH2TJsu5gzwGDEp7c6U20Dbnoakp2=w529-h298-k-no'),
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
                  'Sungai',
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
                    'Jarak 40 Km',
                    style: greenTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              'Curug Panetean',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ),
          Text(
            'Pangliaran, Pancatengah, Kab. Tasikmalaya',
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
