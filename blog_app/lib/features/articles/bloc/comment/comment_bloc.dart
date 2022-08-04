import 'package:blog_app/features/articles/models/comment.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/comment_repository.dart';
import 'comment_event.dart';
import 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentRepository commentRepository;

  CommentBloc({required this.commentRepository})
      : assert(commentRepository != null),
        super(CommentLoading()) {
    print('dffffffffff');
    on<CommentLoad>((event, emit) async {
      emit(CommentLoading());
      // String doctorId = event.id;
      try {
        final comment = await commentRepository.getComments() as List<Comment>;
        emit(CommentLoadSuccess(comment));
      } catch (_) {
        emit(CommentOperationFailure());
      }
    });
    on<CreateComment>(
      (event, emit) async {
        emit(CommentLoading());
        // String doctorId = event.id;
        try {
          await commentRepository.createComment(event.comment);
          List<Comment> comments =
              await commentRepository.getComments() as List<Comment>;
          emit(CommentLoadSuccess(comments));
        } catch (_) {
          emit(CommentOperationFailure());
        }
      },
    );
    on<EditComment>(
      (event, emit) async {
        emit(CommentLoading());
        // String doctorId = event.id;
        try {
          await commentRepository.editComment(event.comment);
          final comments =
              await commentRepository.getComments() as List<Comment>;
          emit(CommentLoadSuccess(comments));
        } catch (_) {
          emit(CommentOperationFailure());
        }
      },
    );
    on<DeleteComment>(
      (event, emit) async {
        emit(CommentLoading());
        // String doctorId = event.id;
        try {
          await commentRepository.deleteComment(event.comment.id);
          final comments =
              await commentRepository.getComments() as List<Comment>;
          emit(CommentLoadSuccess(comments));
        } catch (_) {
          emit(CommentOperationFailure());
        }
      },
    );
  }
}
//
//   @override
//   Stream<CommentState> mapEventToState(CommentEvent event) async* {
//
//     if (event is CreateComment) {
//       try {
//         await commentRepository.createComment(event.comment);
//         final comments = await commentRepository.getComments();
//         yield CommentLoadSuccess(comments);
//       } catch (_) {
//         yield CommentOperationFailure();
//       }
//     }
//
//     if (event is EditComment) {
//       try {
//         await commentRepository.editComment(event.comment);
//         final comments = await commentRepository.getComments();
//         yield CommentLoadSuccess(comments);
//       } catch (_) {
//         yield CommentOperationFailure();
//       }
//     }
//
//     if (event is DeleteComment) {
//       try {
//         await commentRepository.deleteComment(event.comment.id);
//         final comments = await commentRepository.getComments();
//         yield CommentLoadSuccess(comments);
//       } catch (_) {
//         yield CommentOperationFailure();
//       }
//     }
//   }
// }
