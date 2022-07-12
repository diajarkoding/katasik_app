import 'package:flutter/material.dart';
import 'package:katasik_app/helper/constans/theme.dart';

class ShowImage extends StatelessWidget {
  final String photos;
  const ShowImage({Key? key, required this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGrey,
      body: Center(
        child: Container(
          // margin: const EdgeInsets.only(right: 10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
            image:
                DecorationImage(image: NetworkImage(photos), fit: BoxFit.cover),
          ),
        ),
      ),
      // body: Center(
      //   child: SingleChildScrollView(
      //     scrollDirection: Axis.horizontal,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: photos
      //           .map(
      //             (e) => Container(
      //               margin: const EdgeInsets.only(right: 10),
      //               width: MediaQuery.of(context).size.width * 0.99,
      //               height: MediaQuery.of(context).size.height * 0.5,
      //               decoration: BoxDecoration(
      //                 image: DecorationImage(
      //                     image: NetworkImage(e), fit: BoxFit.cover),
      //               ),
      //             ),
      //           )
      //           .toList(),
      //     ),
      //   ),
      // ),
    );
  }
}
