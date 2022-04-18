import 'package:presentation/navigator/base_page.dart';
import 'package:presentation/screen/spalsh/main_spalsh.dart';

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
