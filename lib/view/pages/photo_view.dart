import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoView extends StatelessWidget {
  final PageController pageController;
  final List<dynamic> photos;
  final int index;
  PhotoView({Key? key, required this.photos, required this.index})
      : pageController = PageController(initialPage: index),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: darkGrey,
        body: PhotoViewGallery.builder(
            pageController: pageController,
            itemCount: photos.length,
            builder: (context, index) {
              final imageUrl = photos[index];
              return PhotoViewGalleryPageOptions(
                imageProvider: NetworkImage(imageUrl),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.contained * 4,
              );
            })
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
