import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

import '../../models/article copy.dart';
import '../../repository/article_detail_repository.dart';




part 'article_detail_event.dart';

part 'article_detail_state.dart';

class ArticleDetailBloc extends Bloc<ArticleDetailEvent, ArticleDetailState> {
  final ArticleDetailRepository articleDetailRepository;

  ArticleDetailBloc({required this.articleDetailRepository})
      : super(ArticleDetailInitial()) {
    on<GetArticleById>((event, emit) async {
      emit(ArticleDetailInitial());
      try {
        final article =
            await articleDetailRepository.getArticleById(event.articleId);
        emit(ArticleSuccessState(article));
      } catch (error) {
        emit(ArticleErrorState(error.toString()));
      }
    });
  }
}
