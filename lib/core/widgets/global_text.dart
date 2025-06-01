import 'package:flutter/material.dart';

class GlobalText extends StatelessWidget {
  final String text;
  final GlobalTextType type;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final double? fontSize;
  final String? fontFamily; // ✅ Qo‘shildi

  const GlobalText(
    this.text, {
    super.key,
    this.type = GlobalTextType.bodyMedium,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontWeight,
    this.fontSize,
    this.fontFamily, // ✅ Constructorga qo‘shildi
  });

  // Factory metodlarga ham fontFamily parametrini optional qilib qo‘shamiz
  factory GlobalText.title(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    String? fontFamily, // ✅
  }) {
    return GlobalText(
      text,
      key: key,
      type: GlobalTextType.title,
      color: color,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      fontFamily: fontFamily,
    );
  }

  factory GlobalText.subtitle(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    String? fontFamily, // ✅
  }) {
    return GlobalText(
      text,
      key: key,
      type: GlobalTextType.subtitle,
      color: color,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      fontFamily: fontFamily,
    );
  }

  factory GlobalText.body(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    String? fontFamily, // ✅
  }) {
    return GlobalText(
      text,
      key: key,
      type: GlobalTextType.bodyLarge,
      color: color,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      fontFamily: fontFamily,
    );
  }

  factory GlobalText.caption(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    String? fontFamily, // ✅
  }) {
    return GlobalText(
      text,
      key: key,
      type: GlobalTextType.caption,
      color: color,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      fontFamily: fontFamily,
    );
  }

  @override
  Widget build(BuildContext context) {
    TextStyle baseStyle = _getTextStyle(context);

    // ✅ fontFamily ham shartli ravishda stylega qo‘shildi
    baseStyle = baseStyle.copyWith(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
      fontFamily: fontFamily,
    );

    return Text(
      text,
      style: baseStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  TextStyle _getTextStyle(BuildContext context) {
    switch (type) {
      case GlobalTextType.displayLarge:
        return Theme.of(context).textTheme.displayLarge!;
      case GlobalTextType.displayMedium:
        return Theme.of(context).textTheme.displayMedium!;
      case GlobalTextType.displaySmall:
        return Theme.of(context).textTheme.displaySmall!;
      case GlobalTextType.title:
        return Theme.of(context).textTheme.headlineLarge!;
      case GlobalTextType.subtitle:
        return Theme.of(context).textTheme.headlineMedium!;
      case GlobalTextType.headlineSmall:
        return Theme.of(context).textTheme.headlineSmall!;
      case GlobalTextType.bodyLarge:
        return Theme.of(context).textTheme.bodyLarge!;
      case GlobalTextType.bodyMedium:
        return Theme.of(context).textTheme.bodyMedium!;
      case GlobalTextType.bodySmall:
        return Theme.of(context).textTheme.bodySmall!;
      case GlobalTextType.caption:
        return Theme.of(context).textTheme.labelMedium!;
      case GlobalTextType.overline:
        return Theme.of(context).textTheme.labelSmall!;
    }
  }
}

enum GlobalTextType {
  displayLarge,
  displayMedium,
  displaySmall,
  title,
  subtitle,
  headlineSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  caption,
  overline,
}
