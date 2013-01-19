require "spec_helper"

describe StatisticsTablesController do
  describe "routing" do

    it "routes to #index" do
      get("/statistics_tables").should route_to("statistics_tables#index")
    end

    it "routes to #new" do
      get("/statistics_tables/new").should route_to("statistics_tables#new")
    end

    it "routes to #show" do
      get("/statistics_tables/1").should route_to("statistics_tables#show", :id => "1")
    end

    it "routes to #edit" do
      get("/statistics_tables/1/edit").should route_to("statistics_tables#edit", :id => "1")
    end

    it "routes to #create" do
      post("/statistics_tables").should route_to("statistics_tables#create")
    end

    it "routes to #update" do
      put("/statistics_tables/1").should route_to("statistics_tables#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/statistics_tables/1").should route_to("statistics_tables#destroy", :id => "1")
    end

  end
end
