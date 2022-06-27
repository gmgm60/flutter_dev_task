import 'package:dartz/dartz.dart';
import 'package:flutter_dev_task/features/posts/data/data_sources/remote/post_firebase_service.dart';
import 'package:flutter_dev_task/features/posts/data/models/post/post_model.dart';
import 'package:flutter_dev_task/features/posts/domain/data/data_sources/remote/post_remore_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/data/throw_app_exception.dart';

@injectable
class PostRemoteDataSourceImpl extends PostRemoteDataSource {
  final PostFirebaseService _postFirebaseService;

  PostRemoteDataSourceImpl(this._postFirebaseService);

  @override
  Future<Unit> addPost(PostModel post) async {
    try {
      return await _postFirebaseService.addPost(post);
    } catch (e) {
      throw throwAppException(e);
    }
  }

  @override
  Future<List<PostModel>> getFavPosts()async {
    try {
      return await _postFirebaseService.getFavPosts();
    } catch (e) {
      throw throwAppException(e);
    }
  }

  @override
  Future<List<PostModel>> getPosts() async{
    try {
      return await _postFirebaseService.getPosts();
    } catch (e) {
      throw throwAppException(e);
    }
  }
}
