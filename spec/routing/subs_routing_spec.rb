require "spec_helper"

describe SubsController do
  describe "routing" do

    it "routes to #index" do
      get("/subs").should route_to("subs#index")
    end

    it "routes to #new" do
      get("/subs/new").should route_to("subs#new")
    end

    it "routes to #show" do
      get("/subs/1").should route_to("subs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/subs/1/edit").should route_to("subs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/subs").should route_to("subs#create")
    end

    it "routes to #update" do
      put("/subs/1").should route_to("subs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/subs/1").should route_to("subs#destroy", :id => "1")
    end

  end
end
