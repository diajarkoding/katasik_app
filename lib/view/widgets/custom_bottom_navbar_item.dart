import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:katasik_app/core/viewmodel/control_viewmodel.dart';

import '../../helper/constans/theme.dart';

class CustomBottomNavBarItem extends StatelessWidget {
  final mainPageC = Get.find<ControlViewModel>();

  CustomBottomNavBarItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: ClipRRect(
        child: Obx(
          () => BottomNavigationBar(
            backgroundColor: whiteColor,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: mainPageC.currentIndex.value,
            onTap: (value) {
              mainPageC.changeCurrentIndex(value);
            },
            items: [
              BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  Icons.home,
                  size: 26,
                  color: mainPageC.currentIndex.value == 0
                      ? blackColor
                      : greyColor,
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  Icons.map,
                  size: 26,
                  color: mainPageC.currentIndex.value == 1
                      ? blackColor
                      : greyColor,
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Image.asset(
                  'assets/icon_search.png',
                  width: 26,
                  color: mainPageC.currentIndex.value == 2
                      ? blackColor
                      : greyColor,
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  Icons.settings,
                  size: 26,
                  color: mainPageC.currentIndex.value == 3
                      ? blackColor
                      : greyColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
