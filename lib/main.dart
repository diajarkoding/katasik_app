import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:katasik_app/core/viewmodel/control_viewmodel.dart';
import 'firebase_options.dart';
import 'helper/routes/app_page.dart';
import 'helper/routes/route_name.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());

  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ControlViewModel());
    // Get.put(DestinationViewModel());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      initialRoute: Routes.homeView,
    );

    // return GetBuilder<DestinationViewModel>(
    //   init: desti,
    //   // initState: (_) {},
    //   builder: (_) {
    //     if (desti.isLoading == true) {
    //       return MaterialApp(
    //         home: Scaffold(
    //           backgroundColor: whiteColor,
    //           body: Center(
    //             child: Text(
    //               'Loading ...',
    //               style: blackTextStyle.copyWith(),
    //             ),
    //           ),
    //         ),
    //       );
    //     } else if (desti.isLoading == false) {
    //       return GetMaterialApp(
    //         debugShowCheckedModeBanner: false,
    //         getPages: AppPages.routes,
    //         initialRoute: Routes.homeView,
    //       );
    //     } else {
    //       return const MaterialApp(
    //         home: HandleLocation(),
    //       );
    //     }
    //   },
    // );

    // return FutureBuilder<Position>(
    //     future: desti.determinePosition(),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return MaterialApp(
    //           home: Scaffold(
    //             backgroundColor: whiteColor,
    //             body: Center(
    //               child: Text(
    //                 'Loading ...',
    //                 style: blackTextStyle.copyWith(),
    //               ),
    //             ),
    //           ),
    //         );
    //       }
    //       if (snapshot.hasData) {
    //         return GetMaterialApp(
    //           debugShowCheckedModeBanner: false,
    //           getPages: AppPages.routes,
    //           initialRoute: Routes.homeView,
    //         );
    //       } else {
    //         return MaterialApp(
    //           home: HandleLocation(),
    //         );
    //       }
    //     });
  }
}
