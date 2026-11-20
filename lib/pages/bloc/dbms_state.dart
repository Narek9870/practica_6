part of 'dbms_bloc.dart';

@immutable
sealed class DbmsState {
  const DbmsState();
}

//Стартовое состояние (ничего не загружено)
final class DbmsInitial extends DbmsState {
  const DbmsInitial();
}

//Идет загрузка (покажем крутящийся индикатор)
final class DbmsLoading extends DbmsState {
  const DbmsLoading();
}

//Успешная загрузка (передаем готовый список БД на экран)
final class DbmsLoaded extends DbmsState {
  final List<Dbms> dbmsList;
  const DbmsLoaded(this.dbmsList);
}

//Ошибка (передаем текст ошибки)
final class DbmsError extends DbmsState {
  final String message;
  const DbmsError(this.message);
}