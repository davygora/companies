FactoryGirl.define do
  factory :company do
    name "CompanyNew"
    location "Ukraine"

    factory :company_with_employees do
      transient do
        employees_count 5
      end

      after(:create) do |company, evaluator|
        create_list(:employees, evaluator.employees_countm, company: company)
      end
    end
  end
end