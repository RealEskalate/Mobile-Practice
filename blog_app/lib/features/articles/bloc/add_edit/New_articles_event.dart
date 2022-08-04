import 'package:equatable/equatable.dart';

abstract class ArticlesEvent extends Equatable{
    @override
  List<Object?> get props => throw UnimplementedError();
}

class GetArticlesEvent extends ArticlesEvent {}
class PublishArticleEvent extends ArticlesEvent{
  String title;
  String subtitle;
  String discription;
  PublishArticleEvent(this.title, this.subtitle, this.discription);
}
class UpdateArticleEvent extends ArticlesEvent{
  String title;
  String subtitle;
  String discription;
  UpdateArticleEvent(this.title, this.subtitle, this.discription);
}