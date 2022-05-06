import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutViewModel extends GetxController {
  Future<void> goToAssetSource(String url) async {
    final linkUrl = url;
    try {
      if (await canLaunch(linkUrl)) {
        await launch(
          url,
          // Webview in flutter
          // forceSafariVC: true,
          // forceWebView: true,
          // enableJavaScript: true,
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}
