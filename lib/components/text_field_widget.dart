import 'package:bushidose/components/text_widget.dart';
import 'package:bushidose/theme/app_colors.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    required this.text,
    required this.controller,
  });

  final String text;
  final TextEditingController controller;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool _isNotEmpty = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_checkText);
    _checkText();
  }

  void _checkText() {
    setState(() {
      _isNotEmpty = widget.controller.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(_checkText);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: widget.text,
          textStyle: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            color: AppColors.textBlue,
            fontWeight: FontWeight.w700,
            height: 16.94 / 14,
            textBaseline: TextBaseline.alphabetic,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: widget.controller,
          style: const TextStyle(
            fontFamily: 'Inter',
            color: Color(0xffB9B9B9),
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 19.36 / 16,
            textBaseline: TextBaseline.alphabetic,
          ),
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            suffixIcon: _isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      _checkText();
                      widget.controller.clear();
                    },
                  )
                : null,
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xffE6E6E6),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xffE6E6E6),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xffE6E6E6),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
