require 'spec_helper'

describe BlocksHelper do
  describe "render_block" do
    describe "if block exists" do
      let(:block) { create(:block, name: 'my-block', title: 'This is the title', body: 'This is the body') }
      let(:render_block) { helper.render_block block.name }

      it "renders the title" do
        render_block.should include('This is the title')
      end

      it "renders the body" do
        render_block.should include('This is the body')
      end
    end

    describe "if block doesn't exist" do
      let(:render_block) { helper.render_block "no-such-block" }

      it "does nothing" do
        render_block.blank?.should == true
      end
    end
  end
end