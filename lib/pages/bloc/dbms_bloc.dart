import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart'; // ДОБАВИЛИ ДЛЯ DI
import '../../models/dbms.dart';
import '../../data/dbms_repository.dart'; // ПОДКЛЮЧИЛИ РЕПОЗИТОРИЙ

part 'dbms_event.dart';
part 'dbms_state.dart';

@injectable // Говорим DI-контейнеру, что он должен сам создавать этот BLoC
class DbmsBloc extends Bloc<DbmsEvent, DbmsState> {
  final DbmsRepository repository; // BLoC теперь зависит от Репозитория

  // Внедрение зависимости через конструктор
  DbmsBloc(this.repository) : super(const DbmsInitial()) {
    on<LoadDbmsEvent>(_onLoadDbms);
  }

  Future<void> _onLoadDbms(LoadDbmsEvent event, Emitter<DbmsState> emit) async {
    emit(const DbmsLoading());
    try {
      //Просим данные у Репозитория (а он сам сходит в базу Drift)
      final terms = await repository.fetchDbmsList();

      //Выдаем успешное состояние с данными из базы
      emit(DbmsLoaded(terms));
    } catch (e) {
      debugPrint('Ошибка загрузки терминов: $e'); // Вывод ошибки в консоль
      emit(const DbmsError('Не удалось загрузить данные'));
    }
  }
}