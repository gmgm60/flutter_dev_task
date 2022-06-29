import 'package:dartz/dartz.dart';
import 'package:flutter_dev_task/core/domain/failures/app_failure.dart';
import 'package:flutter_dev_task/features/posts/data/mappers/post_mapper.dart';
import 'package:flutter_dev_task/features/posts/domain/data/data_sources/remote/post_remore_data_source.dart';
import 'package:flutter_dev_task/features/posts/domain/data/repository/post_repository.dart';
import 'package:flutter_dev_task/features/posts/domain/entities/post/post.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../../../../core/data/return_app_failure.dart';
import '../../../../core/domain/app_exception/app_exception.dart';
import '../../domain/data/data_sources/local/posts_local_data_source.dart';

@Injectable(as: PostRepository)
class PostRepositoryImpl extends PostRepository {
  final Logger _logger;
  final PostRemoteDataSource _postRemoteDataSource;
  final PostsLocalDataSource _postsLocalDataSource;

  PostRepositoryImpl(
      this._logger, this._postRemoteDataSource, this._postsLocalDataSource);

  @override
  Future<Either<AppFailure, Unit>> addPost(Post post) async {
    try {
      await _postRemoteDataSource.addPost(post.toModel);
      return right(unit);
    } on AppException catch (e) {
      _logger.v(e.toString());
      return left(returnAppFailure(e));
    }
  }

  @override
  Future<Either<AppFailure, List<Post>>> getFavPosts() async {
    try {
      final postsModel = await _postRemoteDataSource.getFavPosts();
      final posts = postsModel.map((postModel) => postModel.toEntity).toList();
      return right(posts);
    } on AppException catch (e) {
      _logger.v(e.toString());
      return left(returnAppFailure(e));
    }
  }

  @override
  Future<Either<AppFailure, List<Post>>> getPosts() async {
    try {
      final postsModel = await _postRemoteDataSource.getPosts();
      final posts = postsModel.map((postModel) => postModel.toEntity).toList();
      _postsLocalDataSource.savePosts(posts: postsModel);
      return right(posts);
    } on AppException catch (e) {
      _logger.v(e.toString());
      return left(returnAppFailure(e));
    }
  }

  @override
  Future<Either<AppFailure, Unit>> updatePost(Post post) async {
    try {
      await _postRemoteDataSource.updatePost(post.toModel);
      return right(unit);
    } on AppException catch (e) {
      _logger.v(e.toString());
      return left(returnAppFailure(e));
    }
  }

  @override
  Future<Either<AppFailure, List<Post>>> getLocalPosts() async {
    try {
      final postsModel = await _postsLocalDataSource.getLocalPosts();
      final posts = postsModel.map((postModel) => postModel.toEntity).toList();
      return right(posts);
    } on AppException catch (e) {
      _logger.v(e.toString());
      return left(returnAppFailure(e));
    }
  }
}
