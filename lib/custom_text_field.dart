import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.hintStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
  });
  final TextEditingController controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hintText;
  final TextStyle? hintStyle;
  final bool isPassword;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword && !isShowPassword,
      autocorrect: !widget.isPassword,
      enableSuggestions: !widget.isPassword,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
          ? InkWell(
            onTap: () {
              setState(() {
                isShowPassword = !isShowPassword;
              });
            },
            child: Icon(
              isShowPassword ? PhosphorIcons.eye_fill : PhosphorIcons.eye_slash_fill,
              size: 24,
              color: const Color(0xFF8C8C8C),
            ),
          )
          : widget.suffixIcon,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle,
        contentPadding: const EdgeInsets.symmetric( vertical: 16, horizontal: 12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFC8C8C8), width: 1, strokeAlign: BorderSide.strokeAlignOutside),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFC8C8C8), width: 1, strokeAlign: BorderSide.strokeAlignOutside),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFC8C8C8), width: 1, strokeAlign: BorderSide.strokeAlignOutside),
        ),
      ),
    );
  }
}