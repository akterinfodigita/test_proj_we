import '../../core/app/app_flavor.dart';

class ApiUrls {
  static String baseUrl = getServerUrl();
  static const String liveUrl =
      'http://apptest.dokandemo.com/wp-json/wp/'; //live server
  static const String devUrl =
      'http://apptest.dokandemo.com/wp-json/wp/'; // dev server
  static const String testUrl =
      'http://apptest.dokandemo.com/wp-json/wp/'; // test server

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
  static const String loginUrl = 'jwt-auth/v1/token';
  static const String registrationUrl = 'wc/v3/customers';
  static const String productUrl = 'wc/v3/products';
  static const String categoryUrl = 'wc/v3/products/categories';
  static const String cartUrl = 'cocart/v2/cart';
  static const String updateCart = 'cocart/v2/cart/item/';
}
