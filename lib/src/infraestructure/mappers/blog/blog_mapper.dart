import '../../../domain/entities/blog/blog.dart' as domain;
import '../../models/blog/blog.dart' as infra;

class BlogMapper {
  static domain.GetBlog getBlogResponseToEntity(infra.GetBlogResponse response) => domain.GetBlog(
    ok: response.ok,
    object: domain.GetBlogObject(
      id: response.object.id,
      admin: response.object.admin,
      archived: response.object.archived,
      atype: response.object.atype,
      category: response.object.category,
      executeDate: response.object.executeDate.toIso8601String(),
      extraPoints: response.object.extraPoints,
      moderation: response.object.moderation,
      ownerName: response.object.ownerName,
      points: response.object.points,
      state: response.object.state,
      team: response.object.team,
      permalink: response.object.permalink,
      shortUrl: response.object.shortUrl,
      facebookTabUrl: response.object.facebookTabUrl,
      votesCount: response.object.votesCount,
      votesAverage: response.object.votesAverage,
      votesUp: response.object.votesUp,
      votesDown: response.object.votesDown,
      title: response.object.title,
      body: response.object.body,
      editableBy: response.object.editableBy,
      deleteableBy: response.object.deleteableBy,
      createdAt: response.object.createdAt,
      format: response.object.format,
      tags: response.object.tags,
      participantsTags: response.object.participantsTags,
    ),
  );

  static domain.CreateBlog createBlogResponseToEntity(infra.CreateBlogResponse response) => domain.CreateBlog(
    ok: response.ok,
    activityState: response.activityState,
    message: response.message,
    executionError: response.executionError,
  );

  static domain.DeleteBlog deleteBlogResponseToEntity(infra.DeleteResponse response) => domain.DeleteBlog(
    ok: response.ok,
    message: response.message,
    executionError: response.activityState,
  );

  static domain.UpdateBlog updateBlogResponseToEntity(infra.UpdateBlogResponse response) => domain.UpdateBlog(
    ok: response.ok,
    message: response.message,
    executionError: response.executionError,
  );

  static domain.GetBlogs getBlogsResponseToEntity(infra.GetBlogsResponse response) => domain.GetBlogs(
    ok: response.ok,
    data: domain.GetBlogsData(
      page: response.data.page,
      pageSize: response.data.pageSize,
      totalPages: response.data.totalPages,
      totalData: response.data.totalData,
      blogPosts: response.data.blogPosts.map((blog) => domain.BlogPost(
        id: blog.id,
        admin: blog.admin,
        archived: blog.archived,
        atype: blog.atype,
        category: blog.category,
        executeDate: blog.executeDate,
        extraPoints: blog.extraPoints,
        moderation: blog.moderation,
        ownerName: blog.ownerName,
        points: blog.points,
        state: blog.state,
        team: blog.team,
        permalink: blog.permalink,
        shortUrl: blog.shortUrl,
        facebookTabUrl: blog.facebookTabUrl,
        votesCount: blog.votesCount,
        votesAverage: blog.votesAverage,
        votesUp: blog.votesUp,
        votesDown: blog.votesDown,
        title: blog.title,
        body: blog.body,
        editableBy: blog.editableBy,
        deleteableBy: blog.deleteableBy,
        voted: false,
        createdAt: blog.createdAt,
        format: blog.format,
        tags: blog.tags,
        participantsTags: blog.participantsTags,
        authorName: blog.participant.name,
        authorAvatar: blog.participant.avatar,
        coverUrl: blog.coverUrl,
        videoCoverUrl: blog.videoCoverUrl,
      )).toList(),
    ),
  );
}
