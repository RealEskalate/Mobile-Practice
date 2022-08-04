part of 'article_detail_bloc.dart';

abstract class ArticleDetailState extends Equatable {
  const ArticleDetailState();
}

class ArticleDetailInitial extends ArticleDetailState {
  @override
  List<Object> get props => [];
}

class ArticleSuccessState extends ArticleDetailState{
  final Article article;

  ArticleSuccessState(this.article);
  @override
  List<Object?> get props => [article];

}

class ArticleErrorState extends ArticleDetailState{

  final String error;

  ArticleErrorState(this.error);

  @override
  List<Object?> get props => [error];

}
