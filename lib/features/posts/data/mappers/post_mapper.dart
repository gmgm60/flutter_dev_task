import 'package:flutter_dev_task/features/posts/data/models/post/post_model.dart';
import 'package:flutter_dev_task/features/posts/domain/entities/post/post.dart';

extension ToModel on Post {
  PostModel get toModel => PostModel(imageUrl: imageUrl, text: text);
}

extension ToEntity on PostModel {
  Post get toEntity => Post(imageUrl: imageUrl, text: text);
}
