require "rails_helper"

RSpec.describe FormulationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/formulations").to route_to("formulations#index")
    end


    it "routes to #show" do
      expect(:get => "/formulations/1").to route_to("formulations#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/formulations").to route_to("formulations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/formulations/1").to route_to("formulations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/formulations/1").to route_to("formulations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/formulations/1").to route_to("formulations#destroy", :id => "1")
    end

  end
end
