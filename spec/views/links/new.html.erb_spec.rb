require 'spec_helper'

describe "links/new" do
  before(:each) do
    assign(:link, stub_model(Link,
      :user => nil,
      :title => "MyString",
      :url => "MyString"
    ).as_new_record)
  end

  it "renders new link form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", links_path, "post" do
      assert_select "input#link_user[name=?]", "link[user]"
      assert_select "input#link_title[name=?]", "link[title]"
      assert_select "input#link_url[name=?]", "link[url]"
    end
  end
end
