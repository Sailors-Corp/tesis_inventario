part of 'area_bloc.dart';

sealed class AreaEvent extends Equatable {
  const AreaEvent();

  @override
  List<Object> get props => [];
}

class AreasLoaded extends AreaEvent {
  const AreasLoaded();
}

class AreaDetailLoaded extends AreaEvent {
  const AreaDetailLoaded(this.area);

  final String area;

  @override
  List<Object> get props => [area];
}
