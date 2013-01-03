require 'spec_helper'

describe PostsHelper do
  describe "render_post_archive" do
    before do
      @post1 = create(:post, date: Date.new(2012, 3, 1), title: 'Apples')
      @post2 = create(:post, date: Date.new(2012, 3, 10), title: 'Blueberries')
      @post3 = create(:post, date: Date.new(2012, 1, 1), title: 'Bananas')
      @post4 = create(:post, date: Date.new(2010, 11, 15), title: 'Strawberries')

      @result = render_post_archive
    end

    it "links to all posts by their titles" do
      @result.should include(link_to @post1.title, @post1)
      @result.should include(link_to @post2.title, @post2)
      @result.should include(link_to @post3.title, @post3)
      @result.should include(link_to @post4.title, @post4)
    end

    it "renders months that are present" do
      @result.should include('January')
      @result.should include('March')
      @result.should include('November')
    end

    it "renders years that are present" do
      @result.should include('2012')
      @result.should include('2010')
    end

    it "doesn't render months that aren't present" do
      @result.should_not include('February')
    end

    it "doesn't render years that aren't present" do
      @result.should_not include('2011')
    end
  end
end