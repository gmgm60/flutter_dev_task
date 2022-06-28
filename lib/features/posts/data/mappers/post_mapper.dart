import 'package:flutter_dev_task/features/posts/data/models/post/post_model.dart';
import 'package:flutter_dev_task/features/posts/domain/entities/post/post.dart';

extension ToModel on Post {
  PostModel get toModel => PostModel(userId: userId, imageUrl: imageUrl, text: text, likes: likes, id: id, savedUsers: savedUsers);
}

extension ToEntity on PostModel {
  Post get toEntity => Post(userId: userId, imageUrl: imageUrl, text: text, likes: likes, id: id,savedUsers: savedUsers);
}
