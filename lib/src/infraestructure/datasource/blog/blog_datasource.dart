import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../../config/environment.dart';
import '../../../domain/datasource/blog/blog_datasource.dart';
import '../../../domain/entities/blog/blog.dart';
import '../../../network/pinned_dio.dart';
import '../../mappers/blog/blog_mapper.dart';
import '../../models/blog/blog.dart';

class BlogDatasourceImpl extends BlogDatasource {
  final dio = createPinnedDio(baseUrl: Environment.baseUrl);

  GetBlog _jsonToGetBlog(Map<String, dynamic> json) {
    final getBlogResponse = GetBlogResponse.fromJson(json);
    return BlogMapper.getBlogResponseToEntity(getBlogResponse);
  }

  GetBlogs _jsonToGetBlogs(Map<String, dynamic> json) {
    final getBlogsResponse = GetBlogsResponse.fromJson(json);
    return BlogMapper.getBlogsResponseToEntity(getBlogsResponse);
  }

  CreateBlog _jsonToCreateBlog(Map<String, dynamic> json) {
    final createBlogResponse = CreateBlogResponse.fromJson(json);
    return BlogMapper.createBlogResponseToEntity(createBlogResponse);
  }

  DeleteBlog _jsonToDeleteBlog(Map<String, dynamic> json) {
    final deleteBlogResponse = DeleteResponse.fromJson(json);
    return BlogMapper.deleteBlogResponseToEntity(deleteBlogResponse);
  }

  UpdateBlog _jsonToUpdateBlog(Map<String, dynamic> json) {
    final updateBlogResponse = UpdateBlogResponse.fromJson(json);
    return BlogMapper.updateBlogResponseToEntity(updateBlogResponse);
  }

  Map<String, dynamic> _parseResponse(dynamic raw) =>
      raw is String ? jsonDecode(raw) : Map<String, dynamic>.from(raw as Map);

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
  }) async {
    final data = attachedFile != null
        ? FormData.fromMap({
            'api_key': Environment.apiKey,
            'campaign': Environment.campaign,
            'distinct_id': distinctId,
            'blog_post[title]': title,
            'blog_post[body]': body,
            'blog_post[format]': format,
            'blog_post[category]': category,
            if (tags != null && tags.isNotEmpty) 'blog_post[tags]': tags,
            'blog_post[push_redirect_url]': ?pushRedirectUrl,
            'blog_post[attached_file]': await MultipartFile.fromFile(
              attachedFile.path,
              filename: attachedFile.path.split('/').last,
            ),
          })
        : {
            'api_key': Environment.apiKey,
            'campaign': Environment.campaign,
            'distinct_id': distinctId,
            'blog_post': {
              'title': title,
              'body': body,
              'format': format,
              'category': category,
              if (tags != null && tags.isNotEmpty) 'tags': tags,
              'push_redirect_url': ?pushRedirectUrl,
            },
          };

    final response = await dio.post('/blogs', data: data);
    return _jsonToCreateBlog(_parseResponse(response.data));
  }

  @override
  Future<DeleteBlog> deleteBlog({
    required String distinctId,
    required String blogId,
  }) async {
    final response = await dio.post(
      '/blogs/delete',
      data: {
        'api_key': Environment.apiKey,
        'campaign': Environment.campaign,
        'distinct_id': distinctId,
        'blog_id': blogId,
      }
    );
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToDeleteBlog(responseData);
  }

  @override
  Future<GetBlog> getBlog({required String blogId}) async {
    final response = await dio.post(
      '/blogs/show',
      data: {
        'api_key': Environment.apiKey,
        'campaign': Environment.campaign,
        'blog_id': blogId,
      }
    );
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToGetBlog(responseData);
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
  }) async {
    final response = await dio.post(
      '/blogs/list',
      data: {
        'api_key': Environment.apiKey,
        'campaign': Environment.campaign,
        'distinct_id': ?distinctId,
        'moderation': ?moderation,
        'tags': ?tags,
        'category': ?category,
        'q': ?q,
        'page': ?page,
        'limit': ?limit,
      }
    );
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToGetBlogs(responseData);
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
  }) async {
    final response = await dio.post(
      '/blogs/update',
      data: {
        'api_key': Environment.apiKey,
        'campaign': Environment.campaign,
        'blog_id': blogId,
        'blog_post':{
          'title': title,
          'body': body,
          'format': format,
          'category': category,
          'tags': ?tags,
          'attached_file': ?attachedFile,
        }
      }
    );
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToUpdateBlog(responseData);
  }
}
