part of 'filter_bloc.dart';

@immutable
abstract class FilterState {
  static const List<String> filters = ['All', 'Sports', 'Tech', 'Politics'];
}

class FilterInitial extends FilterState {}

class FilterStateLoading extends FilterState {}

class FilterStateSuccess extends FilterState {
  FilterStateSuccess({required this.id, required this.items});

  final List<Article> items;
  final int id;

  @override
  List<Object> get props => [id, items];

  @override
  String toString() => 'SearchStateSuccess { items: ${items.length} }';
}

class FilterStateError extends FilterState {
  FilterStateError({required this.error});
  final String error;

  @override
  List<Object> get props => [error];
}
