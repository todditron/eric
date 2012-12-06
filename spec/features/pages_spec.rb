require 'spec_helper'

feature 'Pages' do
  describe '#show' do
    it "shows existing pages" do
      about = Page.new(title: 'About')
      about.save
      contact = Page.new(title: 'Contact Us', body: "<h2 class='head'>Hello</h2>", parent: about)
      contact.save

      visit '/about/contact-us'
      page.should have_selector 'h2.head'
    end

    it "returns 404s when page isn't found" do
      lambda { visit "/no-page-here" }.should raise_error ActionController::RoutingError
    end

    it "returns 404s when subpage isn't found" do
      about = Page.new(title: 'About')
      about.save

      visit '/about' # make sure 404 isn't thrown by the /about part
      lambda { visit "/about/no-page-here" }.should raise_error ActionController::RoutingError
    end
  end
end