import 'package:presentation/navigator/base_page.dart';
import 'package:presentation/screen/login/main_login.dart';

class AppData {
  final List<BasePage> pages;

  AppData(this.pages);

  factory AppData.init() {
    final pages = List<BasePage>.from([
      LoginPage.page(),
    ]);
    return AppData(pages);
  }
}
