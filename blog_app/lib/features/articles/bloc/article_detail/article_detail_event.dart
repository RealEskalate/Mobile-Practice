part of 'article_detail_bloc.dart';

abstract class ArticleDetailEvent extends Equatable {
  const ArticleDetailEvent();
}

// class GetArticleById extends ArticleDetailEvent {
//   final String articleId;

//   GetArticleById(this.articleId);

//   @override
//   List<Object?> get props => [articleId];
// }

class GetArticle extends ArticleDetailEvent {
  final Article article;

  GetArticle(this.article);

  @override
  List<Object?> get props => [article];
}
