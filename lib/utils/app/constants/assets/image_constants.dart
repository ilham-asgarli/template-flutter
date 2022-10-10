class ImageConstants {
  static ImageConstants? _instance;

  static ImageConstants get instance => _instance ??= ImageConstants._init();

  ImageConstants._init();

  String get logoLightMode => toPng('ic_logo_light');
  String get logoDarkMode => toPng('ic_logo_dark');
  String get logoPlayStore => toPng('ic_playstore');

  String toPng(String name) => 'assets/images/$name.png';
}