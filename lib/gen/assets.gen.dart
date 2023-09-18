/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsAnimationGen {
  const $AssetsAnimationGen();

  /// File path: assets/animation/.gitkeep
  String get gitkeep => 'assets/animation/.gitkeep';

  /// List of all assets
  List<String> get values => [gitkeep];
}

class $AssetsAudioGen {
  const $AssetsAudioGen();

  /// File path: assets/audio/.gitkeep
  String get gitkeep => 'assets/audio/.gitkeep';

  /// List of all assets
  List<String> get values => [gitkeep];
}

class $AssetsFontGen {
  const $AssetsFontGen();

  /// File path: assets/font/.gitkeep
  String get gitkeep => 'assets/font/.gitkeep';

  /// List of all assets
  List<String> get values => [gitkeep];
}

class $AssetsImageGen {
  const $AssetsImageGen();

  /// File path: assets/image/.gitkeep
  String get gitkeep => 'assets/image/.gitkeep';

  /// File path: assets/image/ic_playstore.png
  AssetGenImage get icPlaystore =>
      const AssetGenImage('assets/image/ic_playstore.png');

  /// List of all assets
  List<dynamic> get values => [gitkeep, icPlaystore];
}

class $AssetsJsonGen {
  const $AssetsJsonGen();

  /// File path: assets/json/.gitkeep
  String get gitkeep => 'assets/json/.gitkeep';

  /// List of all assets
  List<String> get values => [gitkeep];
}

class $AssetsVideoGen {
  const $AssetsVideoGen();

  /// File path: assets/video/.gitkeep
  String get gitkeep => 'assets/video/.gitkeep';

  /// List of all assets
  List<String> get values => [gitkeep];
}

class Assets {
  Assets._();

  static const $AssetsAnimationGen animation = $AssetsAnimationGen();
  static const $AssetsAudioGen audio = $AssetsAudioGen();
  static const $AssetsFontGen font = $AssetsFontGen();
  static const $AssetsImageGen image = $AssetsImageGen();
  static const $AssetsJsonGen json = $AssetsJsonGen();
  static const $AssetsVideoGen video = $AssetsVideoGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
