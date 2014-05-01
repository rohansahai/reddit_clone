require 'spec_helper'

describe "subs/index" do
  before(:each) do
    assign(:subs, [
      stub_model(Sub,
        :user => nil,
        :title => "Title"
      ),
      stub_model(Sub,
        :user => nil,
        :title => "Title"
      )
    ])
  end

  it "renders a list of subs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
