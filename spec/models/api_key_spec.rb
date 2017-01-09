require 'rails_helper'

describe ApiKey do
   before { @api_key = FactoryGirl.build(:api_key) }

   subject { @api_key }

  context 'validations' do
    before(:each) do
      @api_key = FactoryGirl.create(:api_key)
    end

    it 'has a valid factory' do
      build(:api_key).should be_valid
    end
  end

  context 'attributes' do
    it { should respond_to(:access_token) }
    it { should validate_uniqueness_of(:access_token) }
  end

  context 'if some attributes equal nil' do
    it "is not valid without a name" do
      api_key = ApiKey.new(access_token: nil)
      api_key.should_not be_valid
    end
  end
end