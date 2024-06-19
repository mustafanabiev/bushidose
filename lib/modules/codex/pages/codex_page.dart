import 'package:bushidose/components/custom_codex_card.dart';
import 'package:bushidose/models/codex_model.dart';
import 'package:bushidose/modules/codex/pages/codex_detail_page.dart';
import 'package:bushidose/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CodexPage extends StatelessWidget {
  const CodexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Learn the fundamentals of the Samurai principles and philisophy and their application in everyday life',
          style: AppTextStyles.styleF14W300,
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 36),
        Expanded(
          child: ListView.builder(
            itemCount: codexList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CodexDetailPage(
                        codexModel: codexList[index],
                      ),
                    ),
                  );
                },
                child: CustomCodexCard(
                  text: codexList[index].text,
                  text2: codexList[index].text2,
                  text3: codexList[index].text3,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
