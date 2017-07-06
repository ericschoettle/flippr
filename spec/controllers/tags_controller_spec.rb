require 'rails_helper'

RSpec.describe TagsController, type: :controller do

  describe "GET #_new" do
    it "returns http success" do
      get :_new
      expect(response).to have_http_status(:success)
    end
  end

end
