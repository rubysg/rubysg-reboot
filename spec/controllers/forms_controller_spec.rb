require "rails_helper"

RSpec.describe FormsController do

  describe "#show" do
    it "redirects to /404 if feedback form does not exist" do
      get :show, params: { form_type: "non_existent_form" }

      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to("/404")
    end

    it "renders if feedback form exists" do
      get :show, params: { form_type: "behind_the_gems2" }

      expect(response).to have_http_status(:success)
    end
  end

  describe "#create" do
    it "redirects to /404 if form does not exist" do
      post :create, params: { form: { form_type: "non_existent_form" } }

      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to("/404")
    end

    it "renders :show if form submission is unsuccessful" do
      post :create, params: { form: { form_type: "behind_the_gems2" } }

      expect(response).to have_http_status(:success)
    end

    it "redirects to root if form submission is successful" do
      post :create, params: { form: { form_type: "behind_the_gems2", rating: 1, feedback: "none" } }

      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(root_url)
    end
  end
end
