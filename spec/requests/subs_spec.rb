require 'spec_helper'

describe "Subs" do
  describe "GET /subs" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get subs_path
      response.status.should be(200)
    end
  end
end
