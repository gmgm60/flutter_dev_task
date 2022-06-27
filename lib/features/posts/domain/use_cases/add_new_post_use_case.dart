import 'package:dartz/dartz.dart';
import 'package:flutter_dev_task/core/domain/failures/app_failure.dart';
import 'package:flutter_dev_task/core/domain/use_case/use_case.dart';
import 'package:flutter_dev_task/features/posts/domain/data/repository/post_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/post/post.dart';

@injectable
class GetPostsUseCase extends UseCase<Unit, Post> {
  final PostRepository _postRepository;

  GetPostsUseCase(this._postRepository);

  @override
  Future<Either<AppFailure, Unit>> call(Post params) {
    return _postRepository.addPost(params);
  }
}
