part of 'dbms_bloc.dart';

@immutable
sealed class DbmsEvent {
  const DbmsEvent();
}

// Единственное наше событие: Загрузить список СУБД
final class LoadDbmsEvent extends DbmsEvent {
  const LoadDbmsEvent();
}