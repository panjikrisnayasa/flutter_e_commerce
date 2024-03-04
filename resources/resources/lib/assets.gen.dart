/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesIconGen get icon => const $AssetsImagesIconGen();
  $AssetsImagesLogoGen get logo => const $AssetsImagesLogoGen();
  $AssetsImagesOnboardingGen get onboarding =>
      const $AssetsImagesOnboardingGen();
}

class $AssetsImagesIconGen {
  const $AssetsImagesIconGen();

  /// File path: assets/images/icon/account.svg
  SvgGenImage get account =>
      const SvgGenImage('assets/images/icon/account.svg');

  /// File path: assets/images/icon/cart.svg
  SvgGenImage get cart => const SvgGenImage('assets/images/icon/cart.svg');

  /// File path: assets/images/icon/edit.svg
  SvgGenImage get edit => const SvgGenImage('assets/images/icon/edit.svg');

  /// File path: assets/images/icon/history.svg
  SvgGenImage get history =>
      const SvgGenImage('assets/images/icon/history.svg');

  /// File path: assets/images/icon/home.svg
  SvgGenImage get home => const SvgGenImage('assets/images/icon/home.svg');

  /// List of all assets
  List<SvgGenImage> get values => [account, cart, edit, history, home];
}

class $AssetsImagesLogoGen {
  const $AssetsImagesLogoGen();

  /// File path: assets/images/logo/logo.svg
  SvgGenImage get logo => const SvgGenImage('assets/images/logo/logo.svg');

  /// List of all assets
  List<SvgGenImage> get values => [logo];
}

class $AssetsImagesOnboardingGen {
  const $AssetsImagesOnboardingGen();

  /// File path: assets/images/onboarding/onboarding_1.svg
  SvgGenImage get onboarding1 =>
      const SvgGenImage('assets/images/onboarding/onboarding_1.svg');

  /// File path: assets/images/onboarding/onboarding_2.svg
  SvgGenImage get onboarding2 =>
      const SvgGenImage('assets/images/onboarding/onboarding_2.svg');

  /// File path: assets/images/onboarding/onboarding_3.svg
  SvgGenImage get onboarding3 =>
      const SvgGenImage('assets/images/onboarding/onboarding_3.svg');

  /// List of all assets
  List<SvgGenImage> get values => [onboarding1, onboarding2, onboarding3];
}

class Assets {
  Assets._();

  static const String package = 'resources';

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  static const String package = 'resources';

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    @Deprecated('Do not specify package for a generated library asset')
    String? package = package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => 'packages/resources/$_assetName';
}
