class ImageConstants {
  static ImageConstants? _instance;

  static ImageConstants get instance => _instance ??= ImageConstants._init();

  ImageConstants._init();

  String get icPlayStore => toPng('ic_playstore');

  String get icAppStore => toPng('ic_appstore');

  String toPng(String name) => 'assets/images/$name.png';
}
