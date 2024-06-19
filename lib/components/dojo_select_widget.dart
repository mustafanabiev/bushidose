import 'package:bushidose/components/check_box.dart';
import 'package:bushidose/models/dojo_select_model.dart';
import 'package:bushidose/theme/app_colors.dart';
import 'package:bushidose/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DojoSelectWidget extends StatelessWidget {
  const DojoSelectWidget({
    super.key,
    required this.index,
    required this.dojoSelectModel,
    required this.onToggleSelect,
  });

  final int index;
  final DojoSelectModel dojoSelectModel;
  final VoidCallback onToggleSelect;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: GestureDetector(
          onTap: onToggleSelect,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              color: dojoSelectModel.select ? const Color(0xffFFCD03) : null,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: !dojoSelectModel.select
                    ? const Color(0xffB9B9B9)
                    : const Color(0xffFFCD03),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/${dojoSelectModel.icon}.svg',
                      color: dojoSelectModel.select ? AppColors.textBlue : null,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      dojoSelectModel.name,
                      style: dojoSelectModel.select
                          ? AppTextStyles.styleF14W400(
                              color: AppColors.textBlue)
                          : AppTextStyles.styleF14W400(),
                    ),
                  ],
                ),
                CustomCheckbox(value: dojoSelectModel.select),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
