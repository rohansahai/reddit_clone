require 'spec_helper'

describe "subs/show" do
  before(:each) do
    @sub = assign(:sub, stub_model(Sub,
      :user => nil,
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Title/)
  end
end
