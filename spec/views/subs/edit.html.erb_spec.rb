require 'spec_helper'

describe "subs/edit" do
  before(:each) do
    @sub = assign(:sub, stub_model(Sub,
      :user => nil,
      :title => "MyString"
    ))
  end

  it "renders the edit sub form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sub_path(@sub), "post" do
      assert_select "input#sub_user[name=?]", "sub[user]"
      assert_select "input#sub_title[name=?]", "sub[title]"
    end
  end
end
