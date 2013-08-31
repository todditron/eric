class PagesController < ApplicationController
  def show
    @page = Page.find_by_path(params[:path])
  end

  # NOTE: This is super naughty! Rails really doesn't want you to use content_for in controllers,
  #   so we have to jump through this ridiculous hoop. Shouldn't do this.
  #
  # see https://gist.github.com/hiroshi/985457
  # see https://github.com/clmntlxndr/content_for_in_controllers
  def view_context
    super.tap { |actual_view_context| actual_view_context.content_for :meta_description, @page.meta_description }
  end
end
