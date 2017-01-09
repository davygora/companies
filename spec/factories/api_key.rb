FactoryGirl.define do
  require 'securerandom'
  factory :api_key do
    access_token SecureRandom.hex
  end
end
