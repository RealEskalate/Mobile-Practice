// import 'package:demo_project/models/comment_model.dart';
import 'package:equatable/equatable.dart';

import '../../models/comment.dart';


abstract class CommentEvent extends Equatable {
  const CommentEvent();
}
class CommentLoad extends CommentEvent {
  const CommentLoad();

  @override
  List<Object> get props => [];
}
class CreateComment extends CommentEvent{
  final Comment comment;
  const CreateComment( this.comment);

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'Comment Created {comment: $comment}';
}

class EditComment extends CommentEvent {
  final Comment comment;

  const EditComment(this.comment);

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'Comment Updated {comment: $comment}';
}

class DeleteComment extends CommentEvent {
  final Comment comment;

  const DeleteComment(this.comment);

  @override
  List<Object> get props => [comment];

  @override
  toString() => 'Comment Deleted {comment: $comment}';
}

