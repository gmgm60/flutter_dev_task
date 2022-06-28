import 'package:freezed_annotation/freezed_annotation.dart';

part 'posts_state.freezed.dart';

@freezed
class PostsState with _$PostsState {
  factory PostsState.init() = Init;

  factory PostsState.loading() = Loading;

  factory PostsState.postsLoaded() = PostsLoaded;
  factory PostsState.favPostsLoaded() = FavPostsLoaded;
  factory PostsState.postAdded() = PostAdded;

  factory PostsState.error({required String message}) = Error;
}
