import 'package:dartz/dartz.dart';
import 'package:flutter_dev_task/core/domain/failures/app_failure.dart';
import 'package:flutter_dev_task/features/posts/domain/entities/post/post.dart';

abstract class PostRepository {
  Future<Either<AppFailure, List<Post>>> getPosts();

  Future<Either<AppFailure, List<Post>>> getLocalPosts();

  Future<Either<AppFailure, List<Post>>> getFavPosts();

  Future<Either<AppFailure, Unit>> addPost(Post post);

  Future<Either<AppFailure, Unit>> updatePost(Post post);
}
