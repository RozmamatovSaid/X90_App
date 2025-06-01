import 'package:flutter/material.dart';
import 'package:x90/core/constants/colors/app_colors.dart';

class CustomContainer extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final double? borderRadius;
  final Color? borderColor;
  final double? borderWidth;
  final List<BoxShadow>? boxShadow;
  final CustomContainerType type;
  final VoidCallback? onTap;

  const CustomContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
    this.boxShadow,
    this.type = CustomContainerType.basic,
    this.onTap,
  });

  // Factory constructors
  factory CustomContainer.card({
    Key? key,
    Widget? child,
    double? width,
    double? height,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    VoidCallback? onTap,
  }) {
    return CustomContainer(
      key: key,
      width: width,
      height: height,
      padding: padding ?? const EdgeInsets.all(16),
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      type: CustomContainerType.card,
      onTap: onTap,
      child: child,
    );
  }

  factory CustomContainer.rounded({
    Key? key,
    Widget? child,
    double? width,
    double? height,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Color? backgroundColor,
    VoidCallback? onTap,
  }) {
    return CustomContainer(
      key: key,
      child: child,
      width: width,
      height: height,
      padding: padding ?? const EdgeInsets.all(16),
      margin: margin,
      backgroundColor: backgroundColor,
      type: CustomContainerType.rounded,
      onTap: onTap,
    );
  }

  factory CustomContainer.bordered({
    Key? key,
    Widget? child,
    double? width,
    double? height,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Color? borderColor,
    VoidCallback? onTap,
  }) {
    return CustomContainer(
      key: key,
      width: width,
      height: height,
      padding: padding ?? const EdgeInsets.all(16),
      margin: margin,
      borderColor: borderColor,
      type: CustomContainerType.bordered,
      onTap: onTap,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final containerDecoration = _getDecoration(context);

    Widget container = Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: containerDecoration,
      child: child,
    );

    if (onTap != null) {
      return GestureDetector(onTap: onTap, child: container);
    }

    return container;
  }

  BoxDecoration _getDecoration(BuildContext context) {
    switch (type) {
      case CustomContainerType.card:
        return BoxDecoration(
          color: backgroundColor ?? AppColors.cardBackground,
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
          boxShadow:
              boxShadow ??
              [
                const BoxShadow(
                  color: AppColors.cardShadow,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
        );

      case CustomContainerType.rounded:
        return BoxDecoration(
          color: backgroundColor ?? AppColors.lightGray,
          borderRadius: BorderRadius.circular(borderRadius ?? 16),
        );

      case CustomContainerType.bordered:
        return BoxDecoration(
          color: backgroundColor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
          border: Border.all(
            color: borderColor ?? AppColors.borderColor,
            width: borderWidth ?? 1,
          ),
        );

      case CustomContainerType.basic:
        return BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius != null
              ? BorderRadius.circular(borderRadius!)
              : null,
          border: borderColor != null
              ? Border.all(color: borderColor!, width: borderWidth ?? 1)
              : null,
          boxShadow: boxShadow,
        );
    }
  }
}

enum CustomContainerType { basic, card, rounded, bordered }
