require 'rails_helper'

describe ApiKey do

  context 'validations' do
    before(:each) do
      @api_key = FactoryGirl.create(:api_key)
    end

    it 'has a valid factory' do
      build(:api_key).should be_valid
    end
  end
end