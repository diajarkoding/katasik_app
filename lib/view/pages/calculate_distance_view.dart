import 'package:flutter/material.dart';
import 'package:katasik_app/view/widgets/destination_card.dart';

import '../../helper/constans/theme.dart';
import '../widgets/custom_bottom_navbar_item.dart';

class CalculateDistanceView extends StatelessWidget {
  const CalculateDistanceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget address() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(
          defaultMargin,
          secondaryMargin,
          defaultMargin,
          0.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lokasi Anda',
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: greenColor,
                  size: 20,
                ),
                const SizedBox(
                  width: 3,
                ),
                Expanded(
                  child: Text(
                    'Madewangi Setiamulya tamansari tasikmalaya jawa barat',
                    style: greenTextStyle.copyWith(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            )
          ],
        ),
      );
    }

    Widget search() {
      return Container(
        width: double.infinity,
        height: 54,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        margin: const EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: defaultMargin,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: greyColor,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 16,
              ),
              child: Image.asset(
                'assets/icon_search.png',
                width: 26,
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration.collapsed(
                  hintText: 'Cari Wisata',
                  hintStyle: greyTextStyle.copyWith(fontWeight: medium),
                ),
              ),
            ),
            const Icon(
              Icons.location_on,
              color: greyColor,
            ),
          ],
        ),
      );
    }

    Widget destinations() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: defaultMargin,
              bottom: defaultMargin,
            ),
            child: Text(
              'Wisata Terdekat',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
          ),
          GridView(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.5,
              crossAxisSpacing: 18,
            ),
            children: [
              DestinationCard(),
              DestinationCard(),
              DestinationCard(),
              DestinationCard(),
            ],
          )
        ],
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              address(),
              search(),
              destinations(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBarItem(),
    );
  }
}
