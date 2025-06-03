import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// SIZNING THEME BILAN TO'LIQ INTEGRATSIYA QILINGAN CUSTOM TEXTFIELD WIDGETLAR

// 1. Universal Custom TextField - Theme asosida
class CustomTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool enabled;
  final int? maxLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? contentPadding;
  final double borderRadius;
  final bool isDense;

  const CustomTextField({
    Key? key,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.controller,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.enabled = true,
    this.maxLines = 1,
    this.maxLength,
    this.inputFormatters,
    this.focusNode,
    this.contentPadding,
    this.borderRadius = 12.0,
    this.isDense = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final inputTheme = theme.inputDecorationTheme;
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          Text(
            labelText!,
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: colorScheme.onSurface.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 8),
        ],
        LayoutBuilder(
          builder: (context, constraints) {
            // TextField balandligiga qarab fontSize ni hisoblash
            final double fontSize = (constraints.maxHeight * 0.4).clamp(
              12.0,
              16.0,
            );

            return TextFormField(
              controller: controller,
              validator: validator,
              onChanged: onChanged,
              onFieldSubmitted: onSubmitted,
              keyboardType: keyboardType,
              obscureText: obscureText,
              enabled: enabled,
              maxLines: maxLines,
              maxLength: maxLength,
              inputFormatters: inputFormatters,
              focusNode: focusNode,
              style: textTheme.bodyLarge?.copyWith(
                fontSize: fontSize, // Dinamik fontSize
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: inputTheme.hintStyle?.copyWith(
                  fontSize: fontSize, // Hint uchun ham mos fontSize
                ),
                labelStyle: inputTheme.labelStyle?.copyWith(fontSize: fontSize),
                prefixIcon: prefixIcon != null
                    ? Icon(
                        prefixIcon,
                        color: colorScheme.onSurface.withOpacity(0.6),
                        size:
                            fontSize *
                            1.2, // Ikon o'lchamini fontSize'ga moslashtirish
                      )
                    : null,
                suffixIcon: suffixIcon != null
                    ? GestureDetector(
                        onTap: onSuffixTap,
                        child: Icon(
                          suffixIcon,
                          color: colorScheme.onSurface.withOpacity(0.6),
                          size: fontSize * 1.2,
                        ),
                      )
                    : null,
                filled: inputTheme.filled,
                fillColor: inputTheme.fillColor,
                contentPadding:
                    contentPadding ??
                    EdgeInsets.symmetric(
                      vertical: isDense
                          ? 8.0
                          : fontSize * 0.8, // Dinamik padding
                      horizontal: 16,
                    ),
                isDense: isDense,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: BorderSide(
                    color: colorScheme.onSurface.withOpacity(0.2),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: BorderSide(
                    color: colorScheme.onSurface.withOpacity(0.2),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: BorderSide(
                    color: colorScheme.primary,
                    width: 1.5,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: BorderSide(color: colorScheme.error),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: BorderSide(color: colorScheme.error, width: 1.5),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

// 2. Password TextField - Theme asosida
class PasswordTextField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;
  final bool showStrengthIndicator;

  const PasswordTextField({
    Key? key,
    this.labelText,
    this.hintText = 'Parolni kiriting',
    this.controller,
    this.validator,
    this.onChanged,
    this.focusNode,
    this.showStrengthIndicator = false,
  }) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;
  double _strength = 0;

  void _checkPasswordStrength(String password) {
    if (!widget.showStrengthIndicator) return;

    double strength = 0;
    if (password.length >= 8) strength += 0.25;
    if (password.contains(RegExp(r'[A-Z]'))) strength += 0.25;
    if (password.contains(RegExp(r'[0-9]'))) strength += 0.25;
    if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) strength += 0.25;

    setState(() {
      _strength = strength;
    });
  }

  Color _getStrengthColor(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    if (_strength <= 0.25) return colorScheme.error;
    if (_strength <= 0.5) return Colors.orange;
    if (_strength <= 0.75) return Colors.amber;
    return Colors.green;
  }

  String get _strengthText {
    if (_strength <= 0.25) return 'Zaif';
    if (_strength <= 0.5) return 'O\'rtacha';
    if (_strength <= 0.75) return 'Yaxshi';
    return 'Kuchli';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          labelText: widget.labelText,
          hintText: widget.hintText,
          controller: widget.controller,
          validator: widget.validator,
          onChanged: (value) {
            _checkPasswordStrength(value);
            widget.onChanged?.call(value);
          },
          focusNode: widget.focusNode,
          obscureText: _obscureText,
          prefixIcon: Icons.lock_outline,
          suffixIcon: _obscureText ? Icons.visibility_off : Icons.visibility,
          onSuffixTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
        if (widget.showStrengthIndicator &&
            widget.controller?.text.isNotEmpty == true) ...[
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: LinearProgressIndicator(
                  value: _strength,
                  backgroundColor: theme.colorScheme.onSurface.withOpacity(0.2),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    _getStrengthColor(context),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                _strengthText,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: _getStrengthColor(context),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}

// 3. Search TextField - Theme asosida
class SearchTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final VoidCallback? onClear;
  final bool showClearButton;

  const SearchTextField({
    Key? key,
    this.hintText = 'Qidirish...',
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.showClearButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: hintText,
      controller: controller,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      prefixIcon: Icons.search,
      suffixIcon: showClearButton && controller?.text.isNotEmpty == true
          ? Icons.clear
          : null,
      onSuffixTap: () {
        controller?.clear();
        onClear?.call();
      },
      borderRadius: 25,
      isDense: true,
    );
  }
}

// 4. Phone Number TextField - Theme asosida
class PhoneTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const PhoneTextField({
    Key? key,
    this.labelText,
    this.hintText = '+998 (90) 123-45-67',
    this.controller,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      labelText: labelText,
      hintText: hintText,
      controller: controller,
      validator: validator ?? _defaultValidator,
      onChanged: onChanged,
      keyboardType: TextInputType.phone,
      prefixIcon: Icons.phone,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(12),
        _PhoneNumberFormatter(),
      ],
    );
  }

  String? _defaultValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Telefon raqamini kiriting';
    }
    if (value.replaceAll(RegExp(r'[^\d]'), '').length < 9) {
      return 'To\'liq telefon raqamini kiriting';
    }
    return null;
  }
}

// Phone number formatter
class _PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String digitsOnly = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    if (digitsOnly.length <= 9) {
      String formatted = '';
      if (digitsOnly.isNotEmpty) {
        formatted = '+998';
        if (digitsOnly.length > 0) {
          formatted +=
              ' (${digitsOnly.substring(0, digitsOnly.length > 2 ? 2 : digitsOnly.length)}';
          if (digitsOnly.length > 2) {
            formatted +=
                ') ${digitsOnly.substring(2, digitsOnly.length > 5 ? 5 : digitsOnly.length)}';
            if (digitsOnly.length > 5) {
              formatted +=
                  '-${digitsOnly.substring(5, digitsOnly.length > 7 ? 7 : digitsOnly.length)}';
              if (digitsOnly.length > 7) {
                formatted += '-${digitsOnly.substring(7)}';
              }
            }
          }
        }
      }

      return TextEditingValue(
        text: formatted,
        selection: TextSelection.collapsed(offset: formatted.length),
      );
    }

    return oldValue;
  }
}

// 5. OTP TextField - Theme asosida
class OTPTextField extends StatefulWidget {
  final int length;
  final void Function(String)? onCompleted;
  final void Function(String)? onChanged;

  const OTPTextField({
    Key? key,
    this.length = 6,
    this.onCompleted,
    this.onChanged,
  }) : super(key: key);

  @override
  State<OTPTextField> createState() => _OTPTextFieldState();
}

class _OTPTextFieldState extends State<OTPTextField> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      widget.length,
      (index) => TextEditingController(),
    );
    _focusNodes = List.generate(widget.length, (index) => FocusNode());
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty && index < widget.length - 1) {
      _focusNodes[index + 1].requestFocus();
    }

    String otp = _controllers.map((controller) => controller.text).join();
    widget.onChanged?.call(otp);

    if (otp.length == widget.length) {
      widget.onCompleted?.call(otp);
    }
  }

  void _onBackspace(int index) {
    if (index > 0) {
      _controllers[index - 1].clear();
      _focusNodes[index - 1].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final inputTheme = theme.inputDecorationTheme;
    final colorScheme = theme.colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        widget.length,
        (index) => SizedBox(
          width: 50,
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            style: theme.textTheme.headlineMedium,
            onChanged: (value) => _onChanged(value, index),
            onTap: () {
              _controllers[index].selection = TextSelection.fromPosition(
                TextPosition(offset: _controllers[index].text.length),
              );
            },
            decoration: InputDecoration(
              counterText: '',
              filled: inputTheme.filled,
              fillColor: inputTheme.fillColor,
              border: inputTheme.border,
              enabledBorder: inputTheme.enabledBorder,
              focusedBorder: inputTheme.focusedBorder,
              errorBorder: inputTheme.errorBorder,
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
            ),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onSubmitted: (value) {
              if (value.isEmpty && index > 0) {
                _onBackspace(index);
              }
            },
          ),
        ),
      ),
    );
  }
}

// 6. Email TextField - Theme va validation bilan
class EmailTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;

  const EmailTextField({
    Key? key,
    this.labelText,
    this.hintText = 'example@gmail.com',
    this.controller,
    this.validator,
    this.onChanged,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      labelText: labelText,
      hintText: hintText,
      controller: controller,
      validator: validator ?? _defaultValidator,
      onChanged: onChanged,
      focusNode: focusNode,
      keyboardType: TextInputType.emailAddress,
      prefixIcon: Icons.email_outlined,
    );
  }

  String? _defaultValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email kiritish majburiy';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Noto\'g\'ri email format';
    }
    return null;
  }
}

// 7. TextArea - Ko'p qatorli matn uchun
class TextAreaField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final int maxLines;
  final int? maxLength;

  const TextAreaField({
    Key? key,
    this.labelText,
    this.hintText,
    this.controller,
    this.validator,
    this.onChanged,
    this.maxLines = 4,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      labelText: labelText,
      hintText: hintText,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      maxLines: maxLines,
      maxLength: maxLength,
      prefixIcon: Icons.note_outlined,
    );
  }
}

// 8. Number TextField - Raqamlar uchun
class NumberTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool allowDecimal;
  final bool allowNegative;

  const NumberTextField({
    Key? key,
    this.labelText,
    this.hintText,
    this.controller,
    this.validator,
    this.onChanged,
    this.allowDecimal = false,
    this.allowNegative = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      labelText: labelText,
      hintText: hintText,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      keyboardType: TextInputType.numberWithOptions(
        decimal: allowDecimal,
        signed: allowNegative,
      ),
      prefixIcon: Icons.numbers,
      inputFormatters: [
        if (!allowDecimal && !allowNegative)
          FilteringTextInputFormatter.digitsOnly,
        if (allowDecimal && !allowNegative)
          FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
        if (!allowDecimal && allowNegative)
          FilteringTextInputFormatter.allow(RegExp(r'[0-9-]')),
        if (allowDecimal && allowNegative)
          FilteringTextInputFormatter.allow(RegExp(r'[0-9.-]')),
      ],
    );
  }
}
