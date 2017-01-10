require 'rails_helper'

describe Employee do

  context 'validations' do
    before(:each) do
      @employee = FactoryGirl.create(:employee)
    end

    it 'has a valid factory' do
      build(:employee).should be_valid
    end
  end

  context 'attributes' do
    it { should respond_to(:first_name) }
    it { should respond_to(:last_name) }
    it { should respond_to(:title) }
    it { should respond_to(:birthday) }
    it { should respond_to(:email) }
    it { should respond_to(:phone) }
  end

  context 'if some attributes equal nil' do
    it "is not valid without a first_name " do
      employee = Employee.new(first_name: nil)
      employee.should_not be_valid
    end

    it "is not valid without a last_name" do
      employee = Employee.new(last_name: nil)
      employee.should_not be_valid
    end

    it "is not valid without a title" do
      employee = Employee.new(title: nil)
      employee.should_not be_valid
    end

    it "is not valid without a birthday" do
      employee = Employee.new(birthday: nil)
      employee.should_not be_valid
    end

    it "is not valid without a email" do
      employee = Employee.new(email: nil)
      employee.should_not be_valid
    end

    it "is not valid without a phone" do
      employee = Employee.new(phone: nil)
      employee.should_not be_valid
    end
  end
end