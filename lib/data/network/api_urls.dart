import '../../core/app/app_flavor.dart';

class ApiUrls {
  static String baseUrl = getServerUrl();
  static const String liveUrl = 'https://eloja.ch/wp-json'; //live server
  static const String devUrl = 'https://eloja.ch/wp-json'; // dev server
  static const String testUrl = 'https://eloja.ch/wp-json'; // test server

  // get current flavor url
  static String getServerUrl() {
    if (AppFlavor.getFlavor == FlavorStatus.production) {
      return liveUrl;
    } else if (AppFlavor.getFlavor == FlavorStatus.development) {
      return devUrl;
    } else if (AppFlavor.getFlavor == FlavorStatus.staging) {
      return testUrl;
    } else {
      return liveUrl;
    }
  }

  // api url name start here //
  static const String loginUrl = '/jwt-auth/v1/token';
  static const String registrationUrl = '/wc/v3/customers';
  static const String productUrl = '/wc/v3/products';
  static const String categoryUrl = '/wc/v3/products/categories';
}