enum TitleOfTabBar {
  cardEs,
  cardMx,
  mmEs,
}

extension TitleExt on TitleOfTabBar {
  String get projectName {
    switch (this) {
      case TitleOfTabBar.cardEs:
        return "es-card";
      case TitleOfTabBar.cardMx:
        return "mx-card";
      case TitleOfTabBar.mmEs:
        return "es-moneyman";
    }
  }
}
