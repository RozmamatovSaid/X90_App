import 'package:flutter/material.dart';
import 'package:x90/core/constants/colors/app_colors.dart';

enum AppButtonType { primary, secondary, outline, text }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final AppButtonType type;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final IconData? icon;
  final bool isLoading;
  final bool isDisabled;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.type = AppButtonType.primary,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.icon,
    this.isLoading = false,
    this.isDisabled = false,
  });

  factory AppButton.primary({
    Key? key,
    required String text,
    VoidCallback? onPressed,
    double? width,
    bool isLoading = false,
    bool isDisabled = false,
    IconData? icon,
  }) {
    return AppButton(
      key: key,
      text: text,
      onPressed: onPressed,
      type: AppButtonType.primary,
      width: width,
      isLoading: isLoading,
      isDisabled: isDisabled,
      icon: icon,
    );
  }

  factory AppButton.secondary({
    Key? key,
    required String text,
    VoidCallback? onPressed,
    double? width,
    bool isLoading = false,
    bool isDisabled = false,
    IconData? icon,
  }) {
    return AppButton(
      key: key,
      text: text,
      onPressed: onPressed,
      type: AppButtonType.secondary,
      width: width,
      isLoading: isLoading,
      isDisabled: isDisabled,
      icon: icon,
    );
  }

  factory AppButton.outline({
    Key? key,
    required String text,
    VoidCallback? onPressed,
    double? width,
    bool isLoading = false,
    bool isDisabled = false,
    IconData? icon,
  }) {
    return AppButton(
      key: key,
      text: text,
      onPressed: onPressed,
      type: AppButtonType.outline,
      width: width,
      isLoading: isLoading,
      isDisabled: isDisabled,
      icon: icon,
    );
  }

  factory AppButton.text({
    Key? key,
    required String text,
    VoidCallback? onPressed,
    Color? textColor,
    bool isDisabled = false,
  }) {
    return AppButton(
      key: key,
      text: text,
      onPressed: onPressed,
      type: AppButtonType.text,
      textColor: textColor,
      isDisabled: isDisabled,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget buttonChild = _buildButtonContent(context);

    if (margin != null) {
      buttonChild = Padding(padding: margin!, child: buttonChild);
    }

    return SizedBox(width: width, height: height ?? 52, child: buttonChild);
  }

  Widget _buildButtonContent(BuildContext context) {
    final bool disabled = isDisabled || onPressed == null;

    switch (type) {
      case AppButtonType.primary:
        return ElevatedButton(
          onPressed: disabled || isLoading ? null : onPressed,
          style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                backgroundColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.disabled)) {
                    return AppColors.disabledButton;
                  }
                  return backgroundColor ?? AppColors.primaryButton;
                }),
                foregroundColor: WidgetStateProperty.all(
                    textColor ?? AppColors.buttonText),
                padding: WidgetStateProperty.all(
                    padding ?? const EdgeInsets.symmetric(vertical: 16, horizontal: 24)),
              ),
          child: _buildChild(),
        );

      case AppButtonType.secondary:
        return ElevatedButton(
          onPressed: disabled || isLoading ? null : onPressed,
          style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                backgroundColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.disabled)) {
                    return AppColors.disabledButton;
                  }
                  return backgroundColor ?? AppColors.secondaryButton;
                }),
                foregroundColor: WidgetStateProperty.all(
                    textColor ?? AppColors.secondaryButtonText),
                padding: WidgetStateProperty.all(
                    padding ?? const EdgeInsets.symmetric(vertical: 16, horizontal: 24)),
              ),
          child: _buildChild(),
        );

      case AppButtonType.outline:
        return OutlinedButton(
          onPressed: disabled || isLoading ? null : onPressed,
          style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
                foregroundColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.disabled)) {
                    return AppColors.disabledButton;
                  }
                  return textColor ?? AppColors.primaryText;
                }),
                padding: WidgetStateProperty.all(
                    padding ?? const EdgeInsets.symmetric(vertical: 16, horizontal: 24)),
                side: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.disabled)) {
                    return const BorderSide(color: AppColors.disabledButton, width: 1);
                  }
                  return const BorderSide(color: AppColors.borderColor, width: 1);
                }),
              ),
          child: _buildChild(),
        );

      case AppButtonType.text:
        return TextButton(
          onPressed: disabled || isLoading ? null : onPressed,
          style: Theme.of(context).textButtonTheme.style?.copyWith(
                foregroundColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.disabled)) {
                    return AppColors.disabledButton;
                  }
                  return textColor ?? AppColors.primaryText;
                }),
                padding: WidgetStateProperty.all(
                    padding ?? const EdgeInsets.symmetric(vertical: 12, horizontal: 16)),
              ),
          child: _buildChild(),
        );
    }
  }

  Widget _buildChild() {
    if (isLoading) {
      return const SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.buttonText),
        ),
      );
    }

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20, color: textColor ?? AppColors.buttonText),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: fontSize ?? 16,
              fontWeight: fontWeight ?? FontWeight.w600,
              color: textColor ?? AppColors.buttonText,
            ),
          ),
        ],
      );
    }

    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: textColor ?? AppColors.buttonText,
      ),
    );
  }
}