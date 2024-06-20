import 'package:flutter_bloc/flutter_bloc.dart';

part 'codex_state.dart';

class CodexCubit extends Cubit<CodexState> {
  CodexCubit() : super(CodexInitial());
}
