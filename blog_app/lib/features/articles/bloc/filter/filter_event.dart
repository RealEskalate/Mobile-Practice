part of 'filter_bloc.dart';

@immutable
abstract class FilterEvent {
  const FilterEvent();
}

class FilterChanged extends FilterEvent {
  final int id;
  const FilterChanged({required this.id});

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'Filterchanged { text: $id }';
}

class OnSearch extends FilterEvent {
  final String searchTerm;
  const OnSearch({required this.searchTerm});

  @override
  List<Object> get props => [searchTerm];

  @override
  String toString() => 'Filterchanged { text: $searchTerm }';
}
