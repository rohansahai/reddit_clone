require 'spec_helper'

describe "subs/new" do
  before(:each) do
    assign(:sub, stub_model(Sub,
      :user => nil,
      :title => "MyString"
    ).as_new_record)
  end

  it "renders new sub form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", subs_path, "post" do
      assert_select "input#sub_user[name=?]", "sub[user]"
      assert_select "input#sub_title[name=?]", "sub[title]"
    end
  end
end
