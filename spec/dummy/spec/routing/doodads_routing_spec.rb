require "rails_helper"

RSpec.describe DoodadsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/doodads").to route_to("doodads#index")
    end

    it "routes to #new" do
      expect(get: "/doodads/new").to route_to("doodads#new")
    end

    it "routes to #show" do
      expect(get: "/doodads/1").to route_to("doodads#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/doodads/1/edit").to route_to("doodads#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/doodads").to route_to("doodads#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/doodads/1").to route_to("doodads#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/doodads/1").to route_to("doodads#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/doodads/1").to route_to("doodads#destroy", id: "1")
    end
  end
end
