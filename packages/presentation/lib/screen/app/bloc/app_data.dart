import 'package:presentation/navigator/base_page.dart';
import 'package:presentation/screen/home/home_tab_bar.dart';

class AppData {
  final List<BasePage> pages;

  AppData(this.pages);

  factory AppData.init() {
    final pages = List<BasePage>.from([
      HomeTabBar.page(),
    ]);
    return AppData(pages);
  }
}
