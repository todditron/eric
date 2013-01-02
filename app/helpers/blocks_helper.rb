module BlocksHelper
  def render_block(name)
    block = Block.find_by_name(name)

    if block
      # can't use `render block` because this breaks in devise views on windows
      render partial: 'blocks/block', object: block
    else
      "render_block: Block not found \"#{name}\"" if Rails.env.development?
    end
  end
end
