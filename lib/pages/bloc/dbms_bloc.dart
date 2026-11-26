import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import '../../models/dbms.dart';
import '../../data/dbms_repository.dart';

part 'dbms_event.dart';
part 'dbms_state.dart';

@injectable
class DbmsBloc extends Bloc<DbmsEvent, DbmsState> {
  final DbmsRepository repository;

  DbmsBloc(this.repository) : super(const DbmsInitial()) {
    on<LoadDbmsEvent>(_onLoadDbms);
  }

  Future<void> _onLoadDbms(LoadDbmsEvent event, Emitter<DbmsState> emit) async {
    emit(const DbmsLoading());
    try {
      final terms = await repository.fetchDbmsList();
      emit(DbmsLoaded(terms));
    } catch (e) {
      debugPrint('Ошибка загрузки терминов: $e');
      emit(const DbmsError('Не удалось загрузить данные'));
    }
  }
}
