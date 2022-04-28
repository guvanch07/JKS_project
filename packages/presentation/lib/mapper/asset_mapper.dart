class AssetMapper {
  String mappingAssets(String name) {
    if (name.contains("mx")) {
      return "assets/svg/tab1.svg";
    } else {
      return "assets/svg/tab2.svg";
    }
  }
}
