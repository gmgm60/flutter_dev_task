import 'package:dartz/dartz.dart';
import 'package:flutter_dev_task/features/posts/data/models/post/post_model.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getPosts();

  Future<List<PostModel>> getFavPosts();

  Future<Unit> addPost(PostModel postModel);

  Future<Unit> updatePost(PostModel postModel);

}
