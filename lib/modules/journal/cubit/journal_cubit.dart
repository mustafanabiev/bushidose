import 'package:flutter_bloc/flutter_bloc.dart';

part 'journal_state.dart';

class JournalCubit extends Cubit<JournalState> {
  JournalCubit() : super(JournalInitial());
}
