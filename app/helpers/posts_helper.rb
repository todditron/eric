module PostsHelper
  def render_post_archive
    render partial: 'posts/archive', object: Post.all
  end
end