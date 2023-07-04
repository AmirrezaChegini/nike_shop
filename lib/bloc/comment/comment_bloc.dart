import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_shop/bloc/comment/comment_event.dart';
import 'package:nike_shop/bloc/comment/comment_state.dart';
import 'package:nike_shop/data/repositories/product_comment_repository.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final IProductCommentRepository _repository;

  CommentBloc(this._repository) : super(LoadingCommentState()) {
    on<CommentEvent>((event, emit) async {
      emit(LoadingCommentState());
      await Future.delayed(const Duration(seconds: 1));
      var either = await _repository.getComments(productId: event.produtId);

      either.fold((l) {
        emit(FailedCommentState(l));
      }, (r) {
        emit(CompletedCommentState(r));
      });
    });
  }
}
