require 'spec_helper'

describe Page do
  it "generates a default order" do
    page0 = create(:page)
    page0.order.should == 0
    page1 = create(:page)
    page1.order.should == 1
    page2 = create(:page)
    page2.order.should == 2
  end

  describe "#url" do
    it "includes parent slug" do
      about = create(:page, title: 'About Us')
      contact = create(:page, title: 'Contact', parent: about)
      contact_us = create(:page, title: 'Contact Us', parent: contact)

      contact_us.url.should == '/about-us/contact/contact-us'
    end
  end

  context "when new" do
    it "generates a slug" do
      page = create(:page, title: 'About Us')
      page.slug.should == 'about-us'
    end
  end

  context "when old" do
    context "when slug exists" do
      it "doesn't generate a slug" do
        page = create(:page, title: 'About Us')

        page.update_attributes(slug: 'about')
        page.reload.slug.should == 'about'

        page.update_attributes(title: 'About Our Company')
        page.reload.slug.should == 'about'
      end
    end

    context "when slug blank" do
      it "generates a slug" do
        page = create(:page, title: 'About Us')

        page.update_attributes(slug: 'about')
        page.update_attributes(slug: '')
        page.reload.slug.should == 'about-us'
      end
    end
  end

  describe ".find_by_path" do
    context "when page exists" do
      it "finds the page" do
        about = create(:page, title: 'About')
        contact = create(:page, title: 'Contact', parent: about)
        phone = create(:page, title: 'Phone', parent: contact)

        Page.find_by_path('about/contact/phone').should == phone
      end

      it "finds the page with a leading slash" do
        about = create(:page, title: 'About')
        contact = create(:page, title: 'Contact', parent: about)
        phone = create(:page, title: 'Phone', parent: contact)

        Page.find_by_path('/about/contact/phone').should == phone
      end
    end

    context "when page doesn't exist" do
      it "returns nil" do
        Page.find_by_path('/no-such-page').nil?.should == true
      end
    end

    context "when subpage doesn't exist" do
      it "returns nil" do
        create(:page, title: 'About')

        Page.find_by_path('/about/no-such-page').nil?.should == true
      end
    end
  end

  describe ".find_by_path!" do
    context "when page exists" do
      it "finds the page" do
        about = create(:page, title: 'About')
        contact = create(:page, title: 'Contact', parent: about)
        phone = create(:page, title: 'Phone', parent: contact)

        Page.find_by_path!('about/contact/phone').should == phone
      end
    end

    context "when page doesn't exist" do
      it "throws an exception" do
        ->{ Page.find_by_path!('/no-such-page') }.should raise_error ActiveRecord::RecordNotFound
      end
    end
  end
end
