part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class DataBaseImported extends HomeEvent {
}

class DeleteDataBase extends HomeEvent {
}
