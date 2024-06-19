import 'package:bushidose/modules/codex/pages/codex_page.dart';
import 'package:bushidose/modules/dojo/pages/dojo_page.dart';
import 'package:bushidose/modules/haiku/pages/haiku_page.dart';
import 'package:bushidose/modules/journal/pages/journal_page.dart';
import 'package:flutter/material.dart';

Widget selectPages(String selectedText) {
  switch (selectedText) {
    case 'Haiku':
      return const HaikuPage();
    case 'Journal':
      return const JournalPage();
    case 'Codex':
      return const CodexPage();
    default:
      return const DojoPage();
  }
}
