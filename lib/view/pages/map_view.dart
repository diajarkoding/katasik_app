import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:katasik_app/core/viewmodel/map_viewmodel.dart';
import 'package:katasik_app/helper/constans/theme.dart';

import '../widgets/custom_bottom_navbar_item.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends GetView<MapViewModel> {
  const MapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget mapView() {
      return GoogleMap(
        initialCameraPosition: controller.initialLocation,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        mapType: MapType.normal,
        // markers: mapC.listLatLang
        //     .map((e) => mapC.customMarker(e['position'], e['title']))
        //     .toSet(),
        zoomGesturesEnabled: true,
        zoomControlsEnabled: false,
        onMapCreated: (GoogleMapController googleMapController) {
          controller.mapController = googleMapController;
        },
      );
    }

    Widget zoomButton() {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 10,
          ),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  controller.mapController.animateCamera(
                    CameraUpdate.zoomIn(),
                  );
                },
                child: ClipOval(
                  child: Container(
                    width: 40,
                    height: 40,
                    color: whiteColor,
                    child: const Icon(
                      Icons.add,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  controller.mapController.animateCamera(
                    CameraUpdate.zoomOut(),
                  );
                },
                child: ClipOval(
                  child: Container(
                    width: 40,
                    height: 40,
                    color: whiteColor,
                    child: const Icon(
                      Icons.remove,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget currentLocationButton() {
      return Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            bottom: 40,
          ),
          child: InkWell(
            onTap: () {
              controller.mapController.animateCamera(
                CameraUpdate.newCameraPosition(
                  const CameraPosition(
                    target: LatLng(-7.4441451, 108.0759115),
                    zoom: 9.7,
                  ),
                ),
              );
            },
            child: ClipOval(
              child: Container(
                width: 45,
                height: 45,
                color: whiteColor,
                child: Icon(Icons.my_location),
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          mapView(),
          zoomButton(),
          currentLocationButton(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBarItem(),
    );
  }
}
