import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dev_task/features/posts/data/data_sources/local/posts_local_service.dart';
import 'package:flutter_dev_task/features/posts/data/models/post/post_model.dart';
import 'package:flutter_dev_task/features/posts/domain/data/data_sources/local/posts_local_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/data/throw_app_exception.dart';

@Injectable(as: PostsLocalDataSource)
class PostsLocalDataSourceImpl extends PostsLocalDataSource {
  final PostsLocalService _postsLocalService;

  PostsLocalDataSourceImpl(this._postsLocalService);

  @override
  Future<List<PostModel>> getLocalPosts() async {
    try {
      return await _postsLocalService.getLocalPosts();
    } catch (e) {
      debugPrint(e.toString());
      throw throwAppException(e);
    }
  }

  @override
  Future<Unit> savePosts({required List<PostModel> posts}) async {
    try {
      await _postsLocalService.savePosts(posts);
      return unit;
    } catch (e) {
      throw throwAppException(e);
    }
  }
}
