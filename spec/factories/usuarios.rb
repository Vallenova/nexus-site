# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :usuario do
  	email 				  "usuario@prueba.com"
  	password 			  "ficticio"
  	password_confirmation "ficticio"
  end
end
