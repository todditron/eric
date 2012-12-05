module BlocksHelper
  def render_block(name)
    block = Block.find_by_name(name)

    if block
      render block
    else
      "render_block: Block not found \"#{name}\"" if Rails.env.development?
    end
  end
end
