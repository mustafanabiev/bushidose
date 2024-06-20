import 'package:bushidose/components/text_widget.dart';
import 'package:bushidose/theme/app_colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropdownBtnWidget extends StatelessWidget {
  const DropdownBtnWidget({
    super.key,
    required this.list,
    this.onSaved,
    required this.text,
  });

  final Map<String, List<String>> list;
  final void Function(String?)? onSaved;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextWidget(
          text: text.toUpperCase(),
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
        DropdownButtonFormField2<String>(
          isExpanded: true,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xffFFCD03),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xffFFCD03),
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xffFFCD03),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          hint: const Text(
            'Spring (春, Haru)',
            style: TextStyle(fontSize: 14),
          ),
          items: list.keys
              .expand((category) => [category, ...list[category]!])
              .map((item) {
            if (list.containsKey(item)) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            } else {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              );
            }
          }).toList(),
          validator: (value) {
            if (value == null) {
              return 'Please select gender.';
            }
            return null;
          },
          onChanged: onSaved,
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.only(right: 8),
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.arrow_drop_down,
              color: Color(0xffFFCD03),
            ),
            iconSize: 24,
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xffFFCD03),
                width: 1,
              ),
              color: const Color(0xffFCFCFC),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
        ),
      ],
    );
  }
}
