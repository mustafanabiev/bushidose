import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'codex_state.dart';

class CodexCubit extends Cubit<CodexState> {
  CodexCubit() : super(CodexInitial());
}
