import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:katasik_app/view/widgets/shimmer_loading_card.dart';
import 'package:katasik_app/view/widgets/destination_card.dart';
import '../../core/viewmodel/destination_viewmodel.dart';
import '../../helper/constans/theme.dart';
import '../widgets/custom_bottom_navbar_item.dart';

class NearestDestinationView extends GetView<DestinationViewModel> {
  const NearestDestinationView({Key? key}) : super(key: key);

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
                  child: Obx(
                    () => controller.loading.value
                        ? Text(
                            'Mencari lokasi ... ',
                            style: greenTextStyle.copyWith(fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                          )
                        : Text(
                            controller.address!.value,
                            style: greenTextStyle.copyWith(fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                          ),
                  ),
                ),
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
                onChanged: (value) => controller.filterDestination(
                  value,
                ),
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

    Widget shimmerLoading() {
      return GridView(
        padding: const EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.51,
          crossAxisSpacing: 18,
        ),
        children: const [
          ShimmerLoadingCard(),
          ShimmerLoadingCard(),
          ShimmerLoadingCard(),
          ShimmerLoadingCard()
        ],
      );
    }

    Widget gridViewDistanceDestinations() {
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
          GetBuilder<DestinationViewModel>(
            init: Get.find<DestinationViewModel>(),
            builder: (_) {
              return controller.isLoading
                  ? shimmerLoading()
                  : GridView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: defaultMargin,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.51,
                        crossAxisSpacing: 18,
                      ),
                      children: controller.foundDestination
                          .map(
                            (e) => DestinationCard(
                              destination: e,
                            ),
                          )
                          .toList()
                        ..sort(
                          ((a, b) => a.destination.distance
                              .compareTo(b.destination.distance)),
                        ),
                    );
            },
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              address(),
              search(),
              // shimmerLoading(),
              gridViewDistanceDestinations(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBarItem(),
    );
  }
}
