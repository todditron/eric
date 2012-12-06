class Page < ActiveRecord::Base
  has_ancestry
  extend FriendlyId
  friendly_id :title, use: [:slugged, :scoped], scope: :ancestry

  attr_accessible :parent_id, :parent, :body, :order, :slug, :title,
    as: [:default, :admin]

  validates :title, presence: true

  def self.find_by_path(path)
    # TODO: this gets called twice for all Page requests. should probably be more efficient.
    ancestors = path.split('/').reject { |s| s.empty? }
    result = Page.roots.find_by_slug(ancestors.shift)
    result = result.children.find_by_slug(ancestors.shift) while ancestors.any? && !!result
    result
  end

  def self.find_by_path!(path)
    if result = Page.find_by_path(path)
      result
    else
      raise ActiveRecord::RecordNotFound, "Couldn't find Page with path = #{path}"
    end
  end

  def self.path_exists?(path)
    # TODO: if there's a more efficient way to do this, I should put it here
    Page.find_by_path(path)
  end

  def url
    url = '/'
    url << ancestors.map { |a| a.slug }.join('/') << '/' if !is_root?
    url << slug
  end

  def should_generate_new_friendly_id?
    slug.blank?
  end

  before_save :set_default_order
  def set_default_order
    self.order ||= siblings.any? ? siblings.order('"order" DESC').limit(1).first.order + 1 : 0
  end
end
