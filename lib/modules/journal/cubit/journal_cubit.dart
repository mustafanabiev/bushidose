import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'journal_state.dart';

class JournalCubit extends Cubit<JournalState> {
  JournalCubit() : super(JournalInitial());
}
