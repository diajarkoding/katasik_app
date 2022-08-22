import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:katasik_app/helper/constans/theme.dart';
import 'package:katasik_app/view/widgets/shimmer_loading_card.dart';

import '../../core/viewmodel/destination_viewmodel.dart';
import '../widgets/destination_card.dart';
import 'detail_destination_view.dart';

class CategoryView extends StatelessWidget {
  final String category;
  const CategoryView({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 5,
              left: 7,
            ),
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_sharp,
                size: 26,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              defaultMargin,
              5,
              defaultMargin,
              0,
            ),
            child: Text(
              'Temukan & Jelajahi',
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              defaultMargin,
              5,
              defaultMargin,
              20,
            ),
            child: Text.rich(
              TextSpan(
                text: 'Destinasi Wisata',
                style: greenTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: semiBold,
                ),
                children: [
                  TextSpan(
                    text: ' $category',
                    style: blackTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    // Widget search() {
    //   return Container(
    //     width: double.infinity,
    //     height: 54,
    //     padding: const EdgeInsets.symmetric(horizontal: 16),
    //     margin: const EdgeInsets.symmetric(
    //       horizontal: defaultMargin,
    //       vertical: defaultMargin,
    //     ),
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(100),
    //       border: Border.all(
    //         color: greyColor,
    //         width: 1,
    //       ),
    //     ),
    //     child: Row(
    //       children: [
    //         Padding(
    //           padding: const EdgeInsets.only(
    //             right: 16,
    //           ),
    //           child: Image.asset(
    //             'assets/icon_search.png',
    //             width: 26,
    //           ),
    //         ),
    //         Expanded(
    //           child: TextField(
    //             onChanged: (value) => controller.filterDestination(
    //               value,
    //             ),
    //             decoration: InputDecoration.collapsed(
    //               hintText: 'Cari Wisata',
    //               hintStyle: greyTextStyle.copyWith(fontWeight: medium),
    //             ),
    //           ),
    //         ),
    //         const Icon(
    //           Icons.location_on,
    //           color: greyColor,
    //         ),
    //       ],
    //     ),
    //   );
    // }

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

    Widget gridViewDestinations() {
      return GetBuilder<DestinationViewModel>(
        init: Get.find<DestinationViewModel>(),
        // initState: (c) {
        //   c.controller!.filterByCategory('sungai');
        // },
        builder: (c) {
          return c.isLoading
              ? shimmerLoading()
              : GridView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: defaultMargin,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.57,
                    crossAxisSpacing: 18,
                  ),
                  children: c.foundDestination
                      .map(
                        (e) {
                          return DestinationCard(
                            onTap: () => Get.to(
                              () => DetailDestinaionView(destination: e),
                            ),
                            distance: 0.0,
                            imageUrl: e.image,
                            name: e.name,
                            address: e.address,
                            category: e.category,
                            isDestinaionView: true,
                          );
                        },
                      )
                      .where(
                        (element) =>
                            element.category.toString().toLowerCase().contains(
                                  category.toLowerCase(),
                                ),
                      )
                      .toList()
                  // ..sort(
                  //   ((a, b) => a.category.compareTo(b.category)),
                  // ),
                  );
        },
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              // search(),
              gridViewDestinations(),
            ],
          ),
        ),
      ),
    );
  }
}
