import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart'; // для @immutable
import '../../models/dbms.dart';
import '../../data/dbms_data.dart'; // Подключаем наши данные

// Связываем 3 файла в единое целое
part 'dbms_event.dart';
part 'dbms_state.dart';

class DbmsBloc extends Bloc<DbmsEvent, DbmsState> {
  // Начальное состояние при создании блока – DbmsInitial
  DbmsBloc() : super(const DbmsInitial()) {
    // Регистрируем обработчик для события LoadDbmsEvent
    on<LoadDbmsEvent>(_onLoadDbms);
  }

  Future<void> _onLoadDbms(LoadDbmsEvent event, Emitter<DbmsState> emit) async {
    //Выдаем состояние загрузки
    emit(const DbmsLoading());

    try {
      //Имитируем запрос к серверу (ждем 1 секунду)
      await Future.delayed(const Duration(seconds: 1));

      //Выдаем состояние успеха и передаем туда наши данные из dbms_data.dart
      emit(DbmsLoaded(dbmsData));
    } catch (e) {
      // В случае сбоя выдаем ошибку
      emit(const DbmsError('Не удалось загрузить данные'));
    }
  }
}