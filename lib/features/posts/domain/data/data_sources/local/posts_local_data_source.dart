import 'package:dartz/dartz.dart';
import 'package:flutter_dev_task/features/posts/data/models/post/post_model.dart';

abstract class PostsLocalDataSource {
  Future<List<PostModel>> getLocalPosts();
  Future<Unit> savePosts({required List<PostModel> posts});

}