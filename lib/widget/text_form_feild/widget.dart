import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Enum for reusable validation types
enum ValidationType {
  required,
  email,
  number,
  minLength,
  maxLength,
  phone,
  url,
  custom,
}

/// Utility for input validations
class CustomValidators {
  static String? validate(
    String? value,
    List<ValidationType> types,
    String label, {
    int? minLength,
    int? maxLength,
    String? Function(String?)? customValidator,
  }) {
    for (final type in types) {
      switch (type) {
        case ValidationType.required:
          if (value == null || value.trim().isEmpty)
            return '$label is required.';
          break;
        case ValidationType.email:
          final regex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
          if (value != null && !regex.hasMatch(value))
            return 'Enter a valid email.';
          break;
        case ValidationType.number:
          if (value != null && double.tryParse(value) == null)
            return 'Enter a valid number.';
          break;
        case ValidationType.phone:
          final regex = RegExp(r'^\+?[0-9]{7,15}$');
          if (value != null && !regex.hasMatch(value))
            return 'Enter a valid phone number.';
          break;
        case ValidationType.url:
          final regex = RegExp(
            r'^(https?:\/\/)?([\w\-])+\.{1}([a-zA-Z]{2,63})([\/\w\-.]*)*\/?$',
          );
          if (value != null && !regex.hasMatch(value))
            return 'Enter a valid URL.';
          break;
        case ValidationType.minLength:
          if (minLength != null && (value?.length ?? 0) < minLength) {
            return '$label must be at least $minLength characters.';
          }
          break;
        case ValidationType.maxLength:
          if (maxLength != null && (value?.length ?? 0) > maxLength) {
            return '$label must be at most $maxLength characters.';
          }
          break;
        case ValidationType.custom:
          if (customValidator != null) {
            final result = customValidator(value);
            if (result != null) return result;
          }
          break;
      }
    }
    return null;
  }
}

/// CustomTextFormField works like TextFormField but with flexible validation.
class CustomTextFormField extends FormField<String> {
  /// Label shown above the input
  final String? label;

  /// Placeholder text
  final String? hintText;

  /// Makes the input non-editable
  final bool readOnly;

  /// Makes the input obscure
  final bool obscureText;

  /// Autofocus on screen load
  final bool autoFocus;

  /// Manages text input value
  final TextEditingController? controller;

  /// Enum-based list of validations to apply
  final List<ValidationType>? validationTypes;

  /// For use with ValidationType.minLength
  final int? minLength;

  /// For use with ValidationType.maxLength
  final int? maxLength;

  /// Your own custom validation logic
  final String? Function(String?)? customValidator;

  /// Keyboard type (text, number, email, etc.)
  final TextInputType keyboardType;

  /// Input action (done, next, etc.)
  final TextInputAction? textInputAction;

  /// Optional formatters (e.g., limit length, restrict chars)
  final List<TextInputFormatter>? inputFormatters;

  /// Called when value changes
  final ValueChanged<String>? onChanged;

  /// Called when user hits "submit" on keyboard
  final ValueChanged<String>? onFieldSubmitted;

  /// To manage focus programmatically
  final FocusNode? focusNode;

  CustomTextFormField({
    super.key,
    this.label,
    this.hintText,
    this.readOnly = false,
    this.obscureText = false,
    this.autoFocus = false,
    this.controller,
    this.validationTypes,
    this.minLength,
    this.maxLength,
    this.customValidator,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.inputFormatters,
    this.onChanged,
    this.onFieldSubmitted,
    this.focusNode,
  }) : super(
         validator: (validationTypes != null)
             ? (value) => CustomValidators.validate(
                 value,
                 validationTypes,
                 label ?? 'Field',
                 minLength: minLength,
                 maxLength: maxLength,
                 customValidator: customValidator,
               )
             : null,
         builder: (field) {
           final _CustomTextFormFieldState state =
               field as _CustomTextFormFieldState;

           return Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               if (label != null) ...[
                 Text(
                   label!,
                   style: const TextStyle(fontWeight: FontWeight.w600),
                 ),
                 const SizedBox(height: 6),
               ],
               TextField(
                 controller: state._effectiveController,
                 focusNode: focusNode,
                 keyboardType: keyboardType,
                 textInputAction: textInputAction,
                 inputFormatters: inputFormatters,
                 autofocus: autoFocus,
                 readOnly: readOnly,
                 obscureText: obscureText,
                 onChanged: (val) {
                   field.didChange(val);
                   onChanged?.call(val);
                 },
                 onSubmitted: onFieldSubmitted,
                 decoration: InputDecoration(
                   hintText: hintText,
                   errorText: field.errorText,
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(8),
                   ),
                   contentPadding: const EdgeInsets.symmetric(
                     horizontal: 12,
                     vertical: 14,
                   ),
                 ),
               ),
             ],
           );
         },
       );

  @override
  FormFieldState<String> createState() => _CustomTextFormFieldState();
}

/// Internal controller sync
class _CustomTextFormFieldState extends FormFieldState<String> {
  RestorableTextEditingController? _controller;

  TextEditingController get _effectiveController =>
      (widget as CustomTextFormField).controller ?? _controller!.value;

  @override
  void initState() {
    super.initState();
    final widgetField = widget as CustomTextFormField;
    if (widgetField.controller == null) {
      _controller = RestorableTextEditingController();
      registerForRestoration(_controller!, 'custom_text_controller');
    } else {
      widgetField.controller!.addListener(_onExternalChanged);
    }
  }

  void _onExternalChanged() {
    if (_effectiveController.text != value) {
      didChange(_effectiveController.text);
    }
  }

  @override
  void dispose() {
    (widget as CustomTextFormField).controller?.removeListener(
      _onExternalChanged,
    );
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didChange(String? value) {
    super.didChange(value);
    if (_effectiveController.text != value) {
      _effectiveController.text = value ?? '';
    }
  }
}
