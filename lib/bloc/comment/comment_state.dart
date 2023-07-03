import 'package:equatable/equatable.dart';
import 'package:nike_shop/models/product_comment.dart';

abstract class CommentState extends Equatable {}

class LoadingCommentState extends CommentState {
  @override
  List<Object?> get props => [];
}

class CompletedCommentState extends CommentState {
  final List<ProductComment> productCommentList;
  CompletedCommentState(this.productCommentList);

  @override
  List<Object?> get props => [productCommentList];
}

class FailedCommentState extends CommentState {
  final String errorMessage;
  FailedCommentState(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}
