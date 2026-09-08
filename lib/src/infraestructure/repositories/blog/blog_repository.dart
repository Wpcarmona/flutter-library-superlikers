import 'dart:io';

import '../../../domain/datasource/blog/blog_datasource.dart';
import '../../../domain/entities/blog/blog.dart';
import '../../../domain/repositories/blog/blog_repository.dart';
import '../../datasource/blog/blog_datasource.dart';

class BlogRepositoryImpl extends BlogRepository {
  final BlogDatasource datasource;

  BlogRepositoryImpl([BlogDatasource? datasource])
    : datasource = datasource ?? BlogDatasourceImpl();

  @override
  Future<CreateBlog> createBlog({
    required String title,
    required String body,
    required String format,
    required String category,
    required String distinctId,
    List<String>? tags,
    File? attachedFile,
    String? pushRedirectUrl,
  }) {
    return datasource.createBlog(
      title: title,
      body: body,
      format: format,
      category: category,
      distinctId: distinctId,
      tags: tags,
      attachedFile: attachedFile,
      pushRedirectUrl: pushRedirectUrl,
    );
  }

  @override
  Future<DeleteBlog> deleteBlog({
    required String distinctId,
    required String blogId,
  }) {
    return datasource.deleteBlog(distinctId: distinctId, blogId: blogId);
  }

  @override
  Future<GetBlog> getBlog({required String blogId}) {
    return datasource.getBlog(blogId: blogId);
  }

  @override
  Future<GetBlogs> getBlogs({
    String? distinctId,
    String? moderation,
    List<String>? tags,
    String? category,
    String? q,
    String? page,
    String? limit,
  }) {
    return datasource.getBlogs(
      distinctId: distinctId,
      moderation: moderation,
      tags: tags,
      category: category,
      q: q,
      page: page,
      limit: limit,
    );
  }

  @override
  Future<UpdateBlog> updateBlog({
    required String blogId,
    required String title,
    required String body,
    required String format,
    required String category,
    List<String>? tags,
    File? attachedFile,
  }) {
    return datasource.updateBlog(
      blogId: blogId,
      title: title,
      body: body,
      format: format,
      category: category,
      tags: tags,
      attachedFile: attachedFile,
    );
  }
}
