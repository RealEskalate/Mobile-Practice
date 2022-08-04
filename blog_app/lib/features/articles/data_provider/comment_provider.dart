
import 'package:http/http.dart' as http;

import '../models/comment.dart';
import 'mockArticleDetail.dart';

class CommentProvider {
  final _baseUrl = 'http://192.168.56.1:3000';
  final http.Client httpClient;
  final comments = MockComment().comments;

  CommentProvider({required this.httpClient}) : assert(httpClient != null);

  Future<List<Comment>> getComments() async {
    return comments as List<Comment>;
  }

  Future<Comment> createComment(Comment comment) async {
    // var id = comments.length;
    comments.add(comment);
    return comment;
  }

  Future<void> deleteComment(String id) async {
    // var id = comments.length;
    comments.removeAt(1);
  }

  Future<Comment> editComment(Comment comment) async {
    comments[1] = comment;
    return comment;
  }
}