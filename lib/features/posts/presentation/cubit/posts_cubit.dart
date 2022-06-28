import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_task/core/domain/use_case/use_case.dart';
import 'package:flutter_dev_task/features/posts/domain/use_cases/update_post_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import '../../domain/entities/post/post.dart';
import '../../domain/use_cases/add_new_post_use_case.dart';
import '../../domain/use_cases/get_fav_posts_use_case.dart';
import '../../domain/use_cases/get_posts_use_case.dart';
import 'posts_state.dart';

@injectable
class PostsCubit extends Cubit<PostsState> {
  final Logger _logger;
  final GetPostsUseCase _getPostUseCase;
  final GetFavPostsUseCase _getFavPostsUseCase;
  final AddNewPostUseCase _addPostUseCase;
  final UpdatePostUseCase _postLikeUseCase;
  final List<Post> posts = [];
  final List<Post> favPosts = [];

  PostsCubit(
    this._logger,
    this._getPostUseCase,
    this._getFavPostsUseCase,
    this._addPostUseCase,
    this._postLikeUseCase,
  ) : super(PostsState.init());

  Future<void> getPosts() async {
    emit(PostsState.loading());
    final result = await _getPostUseCase(NoParams());
    result.fold((failure) {
      _logger.v(failure.message);
      emit(PostsState.error(message: failure.message));
    }, (posts) {
      this.posts.clear();
      this.posts.addAll(posts);
      emit(PostsState.postsLoaded());
    });
  }

  Future<void> getFavPosts() async {
    emit(PostsState.loading());
    final result = await _getFavPostsUseCase(NoParams());
    result.fold((failure) {
      _logger.v(failure.message);
      emit(PostsState.error(message: failure.message));
    }, (favPosts) {
      this.favPosts.clear();
      this.favPosts.addAll(favPosts);
      emit(PostsState.favPostsLoaded());
    });
  }

  Future<void> addNewPost({required Post post}) async {
    emit(PostsState.loading());
    final result = await _addPostUseCase(post);
    result.fold((failure) {
      _logger.v(failure.message);
      emit(PostsState.error(message: failure.message));
    }, (unit) async {
      getPosts();
      emit(PostsState.postAdded());
      await Future.delayed(const Duration(seconds: 2));
      emit(PostsState.postsLoaded());
    });
  }

  Future<void> likePost({required Post post, required String userId}) async {
    final index = posts.indexOf(post);
    final List<String> likes = [];
    likes.addAll(post.likes);
    if (likes.contains(userId)) {
      likes.remove(userId);
    } else {
      likes.add(userId);
    }

    posts[index] = post.copyWith(likes: likes);
    emit(PostsState.loading());
    final result = await _postLikeUseCase(posts[index]);
    result.fold((failure) {
      posts[index] = post;
      emit(PostsState.error(message: failure.message));
    }, (unit) {
      emit(PostsState.postsLoaded());
    });
  }

  Future<void> addToFav({required Post post, required String userId}) async {
    final index = posts.indexOf(post);
    final List<String> savedUsers = [];
    savedUsers.addAll(post.savedUsers);
    if (savedUsers.contains(userId)) {
      savedUsers.remove(userId);
    } else {
      savedUsers.add(userId);
    }

    posts[index] = post.copyWith(savedUsers: savedUsers);
    emit(PostsState.loading());
    final result = await _postLikeUseCase(posts[index]);
    result.fold((failure) {
      posts[index] = post;
      emit(PostsState.error(message: failure.message));
    }, (unit) {
      emit(PostsState.postsLoaded());
    });
  }

}
