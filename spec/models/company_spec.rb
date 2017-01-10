require 'rails_helper'

describe Company do

  context 'validations' do
    before(:each) do
      @company = FactoryGirl.create(:company)
    end

    it 'has a valid factory' do
      build(:company).should be_valid
    end
  end

  context 'attributes' do
    it { should respond_to(:name) }
    it { should respond_to(:location) }
  end

  context 'if some attributes equal nil' do
    it "is not valid without a name" do
      company = Company.new(name: nil)
      company.should_not be_valid
    end

    it "is not valid without a location" do
      company = Company.new(location: nil)
      company.should_not be_valid
    end
  end
end