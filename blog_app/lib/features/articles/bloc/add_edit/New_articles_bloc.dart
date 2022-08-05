import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'article_bloc_index.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  ArticlesBloc() : super(EditArticleInitial()) {
    on<ArticlesEvent>((event, emit) async {
      if (event is GetArticlesEvent) {
        emit(FetchingArticle());
        try {
          // ArticleRepository articleRepository = ArticleRepository();
          //  Article article = await articleRepository.getArticles();// this gets the article by id

          // emit(FetchingSuccess());
        } catch (e) {
          emit(FetchingFailure());
          throw "Error!";
        }
      }
      if (event is PublishArticleEvent) {
        emit(PublishingArticle());
        try {
          // ArticleRepository articleRepository = ArticleRepository();
          print(event.title);
          print(event.subtitle);
          print(event.discription);
          // Todo impliment the publish part
          // the event has title, subtitle and discription
          // Article article = await articleRepository.publish();

          emit(PublishSuccesful());
          await Future.delayed(const Duration(seconds: 1));
          emit(EditArticleInitial());
        } catch (e) {
          emit(PublishFailed());
          await Future.delayed(const Duration(seconds: 1));
          emit(EditArticleInitial());
        }
      }
      if (event is UpdateArticleEvent) {
        emit(UpdatingArticle());
        try {
          // ArticleRepository articleRepository = ArticleRepository();
          print(event.title);
          print(event.subtitle);
          print(event.discription);
          // Todo impliment the update part
          // the event has title, subtitle and discription
          
          emit(UpdateSuccesful());
          await Future.delayed(const Duration(seconds: 1));
          ;
          emit(EditArticleInitial());
        } catch (e) {
          emit(UpdateFailed());
          await Future.delayed(const Duration(seconds: 1));
          emit(EditArticleInitial());
        }
      }
    });
  }
}
