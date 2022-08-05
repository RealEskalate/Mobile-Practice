import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../models/article.dart';
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
          Article a = Article(
            title: event.title,
            content: [],
            authorName: "Adrian Smith",
            imageUrl:
                "https://ichef.bbci.co.uk/news/976/cpsprodpb/4A61/production/_124314091_hi065097776.jpg",
            ratingValue: 0,
            numberOfComments: 0,
            authorProfileUrl:
                "https://previews.123rf.com/images/rido/rido2002/rido200200099/141040315-happy-smiling-african-doctor-looking-at-camera-in-medical-office-portrait-of-black-man-doctor-workin.jpg?fj=1",
            createdAt: DateTime.now(),
            authorUserId: '',
            categories: [],
            description: event.discription,
            id: '',
            imageUrls: [],
            rating: {},
            updatedAt: DateTime.now(),
          );

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
