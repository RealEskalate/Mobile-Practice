import 'package:equatable/equatable.dart';

// import '../model/article_model.dart';

abstract class ArticlesState extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class EditArticleInitial extends ArticlesState {}

class FetchingArticle extends ArticlesState {}

class FetchingSuccess extends ArticlesState {
  // final Article article;
  FetchingSuccess();
}

class FetchingFailure extends ArticlesState {}

class PublishingArticle extends ArticlesState{}
class PublishSuccesful extends ArticlesState{}
class PublishFailed extends ArticlesState{}

class UpdatingArticle extends ArticlesState{}
class UpdateSuccesful extends ArticlesState{}
class UpdateFailed extends ArticlesState{}
