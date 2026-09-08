import 'dart:io';

import '../../entities/blog/blog.dart';

abstract class BlogRepository {
  Future<CreateBlog> createBlog({
    required String title,
    required String body,
    required String format,
    required String category,
    required String distinctId,
    List<String>? tags,
    File? attachedFile,
    String? pushRedirectUrl,
  });

  Future<GetBlogs> getBlogs({
    String? distinctId,
    String? moderation,
    List<String>? tags,
    String? category,
    String? q,
    String? page,
    String? limit,
  });

  Future<DeleteBlog> deleteBlog({
    required String distinctId,
    required String blogId,
  });

  Future<GetBlog> getBlog({
    required String blogId,
  });

  Future<UpdateBlog> updateBlog({
    required String blogId,
    required String title,
    required String body,
    required String format,
    required String category,
    List<String>? tags,
    File? attachedFile,
  });
}
