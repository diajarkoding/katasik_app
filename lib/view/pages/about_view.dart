import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:katasik_app/core/viewmodel/about_viewmodel.dart';
import 'package:katasik_app/helper/constans/theme.dart';
import 'package:katasik_app/view/widgets/asset_source.dart';

import '../widgets/custom_bottom_navbar_item.dart';

class AboutView extends GetView<AboutViewModel> {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: secondaryMargin,
            left: defaultMargin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sumber Asset',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: semiBold,
                ),
              ),
              AssetSource(
                name: 'Google Maps',
                onPressed: () {
                  controller.goToAssetSource(
                    'https://www.google.com/maps',
                  );
                },
              ),
              AssetSource(
                name: 'Freepik',
                onPressed: () {
                  controller.goToAssetSource(
                    'https://www.freepik.com/free-icon/',
                  );
                },
              ),
              AssetSource(
                name: 'Flaticon',
                onPressed: () {
                  controller.goToAssetSource(
                    'https://www.flaticon.com/free-icons/',
                  );
                },
              ),
              AssetSource(
                name: 'Pixel BWA',
                onPressed: () {
                  controller.goToAssetSource(
                    'https://pixel.buildwithangga.com/',
                  );
                },
              ),
              AssetSource(
                name: 'Disparpora Kab. Tasikmalaya',
                onPressed: () {
                  controller.goToAssetSource(
                    'https://disparpora.tasikmalayakab.go.id/',
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBarItem(),
    );
  }
}
