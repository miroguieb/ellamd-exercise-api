require 'rails_helper'

RSpec.describe "Formulations", type: :request do
  describe "GET /formulations" do
    it "works! (now write some real specs)" do
      get formulations_path
      expect(response).to have_http_status(200)
    end
  end
end
