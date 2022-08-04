import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

import '../../data_provider/article_provider_interface.dart';
import '../../models/article.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  final ArticleProviderInterface articlesRepository;

  FilterBloc({required this.articlesRepository}) : super(FilterInitial()) {
    on<FilterChanged>((event, emit) async {
      try {
        emit(FilterStateLoading());
        final articlesList = await articlesRepository
            .filterArticles(FilterState.filters[event.id]);
        emit(FilterStateSuccess(items: articlesList, id: event.id));
      } catch (e) {
        emit(FilterStateError(error: e.toString()));
      }
    });

    on<OnSearch>((event, emit) async {
      try {
        emit(FilterStateLoading());
        final articlesList =
            await articlesRepository.searchArticles(event.searchTerm);
        emit(FilterStateSuccess(items: articlesList, id: 0));
      } catch (e) {
        emit(FilterStateError(error: e.toString()));
      }
    });
  }
}
