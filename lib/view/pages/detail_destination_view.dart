import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:katasik_app/helper/constans/theme.dart';
import 'package:katasik_app/view/widgets/facility_item.dart';
import 'package:katasik_app/view/widgets/photos_item.dart';

class DetailDestinaionView extends StatelessWidget {
  const DetailDestinaionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: 400,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                'https://lh5.googleusercontent.com/p/AF1QipNXQdCCsvauH2TJsu5gzwGDEp7c6U20Dbnoakp2=w529-h298-k-no',
              ),
              fit: BoxFit.cover),
        ),
      );
    }

    Widget customShadow() {
      return Container(
        width: double.infinity,
        height: 170,
        margin: const EdgeInsets.only(
          top: 230,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0),
              Colors.black.withOpacity(1.0),
            ],
          ),
        ),
      );
    }

    Widget nameAndAddress() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(
          defaultMargin,
          260,
          defaultMargin,
          0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Curug Panetean',
              style: whiteTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            Text(
              'Pangliaran, Pancatengah, Kab. Tasikmalay',
              style: whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
              ),
            ),
          ],
        ),
      );
    }

    Widget description() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Deskripsi',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              'Curug Panetean Tasikmalaya merupakan curug yang memiliki pemandangan indah berupa bebatuan keren serta memiliki air yang sangat jernih. Curug Panetean ini juga sering disebut Curug Leuwi oleh masyarakat sekitar, karena leuwi sendiri memiliki artian dalam bahasa sunda adalah cekungan dasar air, di curug ini selain memiliki air yang jernih juga airnya yang menenangkan cocok untuk dijadikan sebagai tempat berenang.',
              style: blackTextStyle.copyWith(fontSize: 14, fontWeight: reguler),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      );
    }

    Widget photos() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: defaultMargin,
              top: defaultMargin,
            ),
            child: Text(
              'Photos',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Row(
                  children: const [
                    PhotosItem(
                      imageUrl:
                          'https://lh5.googleusercontent.com/p/AF1QipNXQdCCsvauH2TJsu5gzwGDEp7c6U20Dbnoakp2=w529-h298-k-no',
                    ),
                    PhotosItem(
                      imageUrl:
                          'https://lh5.googleusercontent.com/p/AF1QipNXQdCCsvauH2TJsu5gzwGDEp7c6U20Dbnoakp2=w529-h298-k-no',
                    ),
                    PhotosItem(
                      imageUrl:
                          'https://lh5.googleusercontent.com/p/AF1QipNXQdCCsvauH2TJsu5gzwGDEp7c6U20Dbnoakp2=w529-h298-k-no',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget facility() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(
          defaultMargin,
          defaultMargin,
          defaultMargin,
          0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fasilitas',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 20),
              child: Column(
                children: const [
                  FacilityItem(
                    text: 'Spot foto',
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget mapLocation() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lokasi',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 250,
              width: double.infinity,
              child: GoogleMap(
                mapType: MapType.normal,
                // markers: _marker.toSet(),
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    -7.7458324,
                    108.2524236,
                  ),
                  zoom: 10,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      );
    }

    Widget mapButton() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 21),
        // width: 100,
        height: 55,
        // margin: const EdgeInsets.symmetric(horizontal: 20),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: greenColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(17),
            ),
          ),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Buka Map',
                style:
                    whiteTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.21,
              ),
              const Icon(
                Icons.directions,
                color: whiteColor,
                size: 28,
              ),
              const SizedBox(
                width: 10,
              )
            ],
          ),
        ),
      );
    }

    Widget lineDivider() {
      return const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: defaultMargin,
        ),
        child: Divider(
          thickness: 1,
          // color: greyColor,
        ),
      );
    }

    Widget contac() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(
          defaultMargin,
          0,
          defaultMargin,
          10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kontak',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.416,
                  height: 80,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: greyColor, width: 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Kontak',
                            style: blackTextStyle,
                          ),
                          const Icon(
                            Icons.phone_in_talk,
                            size: 18,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Hubungi',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.416,
                  height: 80,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: greyColor, width: 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Instagram',
                            style: blackTextStyle,
                          ),
                          Image.asset(
                            'assets/icon_instagram.png',
                            width: 18,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Kunjungi',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Column(
        children: [
          nameAndAddress(),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: defaultMargin),
            padding: const EdgeInsets.symmetric(
              vertical: defaultMargin,
            ),
            decoration: const BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                description(),
                photos(),
                facility(),
                mapLocation(),
                mapButton(),
                lineDivider(),
                contac(),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            backgroundImage(),
            customShadow(),
            content(),
          ],
        ),
      ),
    );
  }
}
