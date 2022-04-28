import 'package:presentation/navigator/base_page.dart';
import 'package:presentation/screen/splash/splash.dart';

class AppData {
  final List<BasePage> pages;

  AppData(this.pages);

  factory AppData.init() {
    final pages = List<BasePage>.from([
      SplashScreen.page(),
    ]);
    return AppData(pages);
  }
}
