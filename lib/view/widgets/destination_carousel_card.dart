import 'package:flutter/material.dart';
import 'package:katasik_app/helper/constans/theme.dart';

class DestinationCarouselCard extends StatelessWidget {
  const DestinationCarouselCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: 200,
          margin: const EdgeInsets.only(
            right: defaultMargin,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: NetworkImage(
                  'https://lh5.googleusercontent.com/p/AF1QipNXQdCCsvauH2TJsu5gzwGDEp7c6U20Dbnoakp2=w529-h298-k-no'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: 200,
          margin: const EdgeInsets.only(
            right: defaultMargin,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0),
                Colors.black.withOpacity(1),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 22, left: defaultMargin),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  'Sungai',
                  style: blackTextStyle.copyWith(fontWeight: light),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: defaultMargin,
                    bottom: defaultMargin,
                    right: defaultMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Curug Panetean',
                      style: whiteTextStyle.copyWith(
                          fontSize: 18, fontWeight: semiBold),
                    ),
                    Text(
                      'Pangliaran, Pancatengah, Kab.Tasikmalaya',
                      style: whiteTextStyle.copyWith(
                        fontWeight: light,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
