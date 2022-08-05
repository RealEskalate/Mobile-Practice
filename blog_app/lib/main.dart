import 'package:blog_app/core/index.dart';
import 'package:blog_app/features/auth/data/auth_data_index.dart';
import 'package:blog_app/features/auth/presentation/pages/index.dart';
import 'package:blog_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'features/articles/bloc/article_detail/article_detail_bloc.dart';
import 'features/articles/bloc/comment/comment_bloc.dart';
import 'features/articles/bloc/comment/comment_event.dart';
import 'features/articles/bloc/filter/filter_bloc.dart';
import 'features/articles/data_provider/comment_provider.dart';
import 'features/articles/repository/article_detail_repository.dart';
import 'features/articles/repository/comment_repository.dart';
import 'features/articles/utils/dependency_injector.dart';
import 'features/auth/domain/repository/index.dart';
import 'features/auth/presentation/bloc/signup/signup.dart';
import 'features/auth/presentation/bloc/login/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthRepository authRepo = AuthRepository(
      authDataProvider: AuthDataProvider(httpClient: http.Client()));
  final SecureStorage secureStorage = SecureStorage();

  final CommentRepository commentRepository = CommentRepository(
    dataProvider: CommentProvider(
      httpClient: http.Client(),
    ),
  );
  final ArticleDetailRepository articleDetailRepository =
      ArticleDetailRepository();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
        value: authRepo,
        child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    CommentBloc(commentRepository: this.commentRepository)
                      ..add(CommentLoad()),
              ),
              BlocProvider(
                  create: (context) => ArticleDetailBloc(
                        articleDetailRepository: this.articleDetailRepository,
                      )),
              BlocProvider(
                create: (context) => FilterBloc(
                    articlesRepository:
                        DependencyInjector.getArticlesRepository()!),
              ),
              BlocProvider(
                create: (_) => SignupBloc(
                  authRepository: authRepo,
                ),
              ),
              BlocProvider(
                create: (context) => LoginBloc(
                  authRepository: authRepo,
                ),
              ),
            ],
            child:
                BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Blog demo',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                initialRoute: LoginPage.rounteName,
                onGenerateRoute: PageRouter.generateRoute,
              );
            })));
  }
}
