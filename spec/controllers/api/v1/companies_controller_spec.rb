require 'spec_helper'

describe Api::V1::CompaniesController do
  
  describe "GET #show" do
    before(:each) do
      @company = FactoryGirl.create :company
      @api_key = FactoryGirl.create :api_key
      get :show, id: @company.id, access_token: @api_key.access_token, format: :json
    end

    it 'returns the info about a company on a hash' do
      company_response = JSON.parse(response.body, symbolize_names: true)
      expect(company_response[:company][:name]).to eql @company[:name]
    end

    it { expect(response).to have_http_status(200) }
  end

  describe "GET #show" do
    before(:each) do
      @company = FactoryGirl.create :company
      get :show, id: @company, format: :json
    end

    it { expect(response).to have_http_status(401) }
  end

  describe "POST #create" do
    context "when is successfully created" do
      before(:each) do
        @company_attributes = FactoryGirl.attributes_for :company
        @api_key = FactoryGirl.create :api_key
        post :create, { company: @company_attributes, access_token: @api_key.access_token }
      end

      it "renders the json representation for the company record just created" do
        company_response = JSON.parse(response.body, symbolize_names: true)
        expect(company_response[:name]).to eql @company_attributes[:name]
      end

      it { expect(response).to have_http_status(201) }
    end

    context "when is not created" do
      before(:each) do
        @invalid_attributes = { location: "ENG" }
        @api_key = FactoryGirl.create :api_key
        post :create, { company: @invalid_attributes, access_token: @api_key.access_token }
      end

      it "renders an errors json" do
        company_response = json_response
        expect(company_response).to have_key(:errors)
      end

      it "renders the json errors on when the company could not be created" do
        company_response = json_response
        expect(company_response[:errors][:name]).to include "can't be blank"
      end

      it { expect(response).to have_http_status(422) }
    end
  end

  describe "PUT/PATCH #update" do
    before(:each) do
      @company = FactoryGirl.create :company
      @api_key = FactoryGirl.create :api_key
    end

    context "when is successfully updated" do
      before(:each) do
        patch :update, { id: @company.id, access_token: @api_key.access_token, company: { name: "newName" } }
      end

      it "renders the json representation for the updated company" do
        company_response = json_response
        expect(company_response[:name]).to eql "newName"
      end

      it { expect(response).to have_http_status(200) }
    end

    context "when is not created" do
      before(:each) do
        patch :update, { id: @company.id, access_token: @api_key.access_token, company: { name: "" } }
      end

      it "renders an errors json" do
        company_response = json_response
        expect(company_response).to have_key(:errors)
      end

      it "renders the json errors on whye the company could not be created" do
        company_response = json_response
        expect(company_response[:errors][:name]).to include "can't be blank"
      end

      it { expect(response).to have_http_status(422) }
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @company = FactoryGirl.create :company
      @api_key = FactoryGirl.create :api_key
      delete :destroy, { id: @company.id, access_token: @api_key.access_token }
    end

    it { expect(response).to have_http_status(204) }
  end
end
