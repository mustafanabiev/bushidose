import 'package:bushidose/models/codex_model.dart';
import 'package:bushidose/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CodexDetailPage extends StatelessWidget {
  const CodexDetailPage({super.key, required this.codexModel});

  final CodexModel codexModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox.square(),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: SvgPicture.asset('assets/icons/close.svg'),
                  ),
                ],
              ),
              const SizedBox(height: 54),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${codexModel.text2} ${codexModel.text3}'.toUpperCase(),
                      style: AppTextStyles.styleF14W700,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      codexModel.description,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w400,
                        height: 16 / 14,
                        textBaseline: TextBaseline.alphabetic,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
