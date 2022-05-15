import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:katasik_app/helper/routes/route_name.dart';
import 'package:katasik_app/view/widgets/destination_carousel_card.dart';
import 'package:katasik_app/view/widgets/shimmer_loading_carousel_card.dart';
import '../../core/viewmodel/destination_viewmodel.dart';
import '../../helper/constans/theme.dart';
import '../widgets/categories_card.dart';
import '../widgets/custom_bottom_navbar_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      'Hallo,\nTraveler ..',
                      style: blackTextStyle.copyWith(
                          fontSize: 24, fontWeight: semiBold),
                    ),
                  ),
                  Text(
                    'Jelajahi Destinasi Wisata Kab. Tasikmalaya',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/image_profile.png'),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget bannerImage() {
      return Container(
        margin: const EdgeInsets.fromLTRB(
          defaultMargin,
          secondaryMargin,
          defaultMargin,
          0,
        ),
        width: double.infinity,
        height: 210,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
              image: AssetImage(
                'assets/image_disparpora.png',
              ),
              fit: BoxFit.fill),
        ),
      );
    }

    Widget categories() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: secondaryMargin, left: 25, bottom: defaultMargin),
            child: Text(
              'Kategori Wisata',
              style: blackTextStyle.copyWith(
                  fontSize: defaultMargin, fontWeight: semiBold),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(
                  width: defaultMargin,
                ),
                Row(
                  children: const [
                    CategoriesCard(
                        image: 'assets/icon_beach.png', title: 'Pantai'),
                    CategoriesCard(
                        image: 'assets/icon_forest.png', title: 'Hutan'),
                    CategoriesCard(
                        image: 'assets/icon_mountain.png', title: 'Gunung'),
                    CategoriesCard(
                        image: 'assets/icon_agrowisata.png',
                        title: 'Agrowisata'),
                    CategoriesCard(
                        image: 'assets/icon_budaya.png', title: 'Budaya'),
                    CategoriesCard(
                        image: 'assets/icon_edukasi.png', title: 'Edukasi'),
                    CategoriesCard(
                        image: 'assets/icon_religi.png', title: 'Religi'),
                    CategoriesCard(
                        image: 'assets/icon_sungai.png', title: 'Sungai'),
                  ],
                ),
                const SizedBox(
                  width: 4,
                ),
              ],
            ),
          )
        ],
      );
    }

    Widget shimmerLoading() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const SizedBox(
              width: defaultMargin,
            ),
            Row(
              children: const [
                ShimmerLoadingCarouselCard(),
                SizedBox(
                  width: defaultMargin,
                ),
                ShimmerLoadingCarouselCard(),
              ],
            ),
          ],
        ),
      );
    }

    Widget destination() {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
              top: secondaryMargin,
              right: defaultMargin,
              bottom: defaultMargin,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Destinasi Wisata',
                  style: blackTextStyle.copyWith(
                    fontSize: defaultMargin,
                    fontWeight: semiBold,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.destinationView);
                  },
                  child: Text(
                    'Lihat Semua',
                    style: greyTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          GetBuilder<DestinationViewModel>(
            init: Get.find<DestinationViewModel>(),
            builder: (controller) => controller.isLoading
                ? shimmerLoading()
                : SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: defaultMargin,
                        ),
                        Row(
                          children: controller.destinations
                              .map(
                                (e) => DestinationCarouselCard(
                                  destination: e,
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: ListView(
        children: [
          header(),
          bannerImage(),
          categories(),
          destination(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBarItem(),
    );
  }
}
