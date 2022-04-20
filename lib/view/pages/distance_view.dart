import 'package:flutter/material.dart';

import '../widgets/custom_bottom_navbar_item.dart';

class DistanceView extends StatelessWidget {
  const DistanceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Distance'),
      ),
      bottomNavigationBar: CustomBottomNavBarItem(),
    );
  }
}
