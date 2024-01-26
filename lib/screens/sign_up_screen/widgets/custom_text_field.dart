import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.title,
    required this.hint,
    this.onChange,
    this.inputFormatter,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText,
    this.keyboardType,
  });

  final String title;
  final String hint;
  final Function(String)? onChange;
  final List<TextInputFormatter>? inputFormatter;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          maxLines: 1,
          cursorColor: Colors.blue,
          onChanged: onChange,
          inputFormatters: inputFormatter,
          obscureText: obscureText??false,
          keyboardType: keyboardType,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black
          ),
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            prefixIconConstraints: const BoxConstraints(maxWidth: 60),
            suffixIcon: suffixIcon,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFE7ECF3)),
              borderRadius: BorderRadius.circular(6),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFE7ECF3)),
              borderRadius: BorderRadius.circular(6),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(6),
            ),
            hintText: hint,
            hintStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xFF949CA9),
            ),
          ),
        ),
      ],
    );
  }
}
