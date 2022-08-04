import 'package:meta/meta.dart';

import '../data_provider/comment_provider.dart';
import '../models/comment.dart';

class CommentRepository {
  final CommentProvider dataProvider;

  CommentRepository({required this.dataProvider});

  Future<List<Comment>> getComments() async {
    return await dataProvider.getComments();
  }

  Future<void> deleteComment(String id) async {
    await dataProvider.deleteComment(id);
  }

  Future<Comment> createComment(Comment comment) async {
    return await dataProvider.createComment(comment);
  }

  Future<void> editComment(Comment comment) async {
    await dataProvider.editComment(comment);
  }
}
