require 'spec_helper'

describe "comments/edit" do
  before(:each) do
    @comment = assign(:comment, stub_model(Comment,
      :body => "MyText",
      :user => nil,
      :link => nil,
      :comment => nil
    ))
  end

  it "renders the edit comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do
      assert_select "textarea#comment_body[name=?]", "comment[body]"
      assert_select "input#comment_user[name=?]", "comment[user]"
      assert_select "input#comment_link[name=?]", "comment[link]"
      assert_select "input#comment_comment[name=?]", "comment[comment]"
    end
  end
end
