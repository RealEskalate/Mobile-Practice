
import 'package:equatable/equatable.dart';

import '../../models/comment.dart';


class CommentState extends Equatable {
  const CommentState();

  @override
  List<Object> get props => [];
}

class CommentLoading extends CommentState {}

class CommentLoadSuccess extends CommentState {
  final List<Comment> comments;

  CommentLoadSuccess([this.comments = const []]);

  @override
  List<Object> get props => [comments];
}

class CommentOperationFailure extends CommentState {}
