# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ingredient do
    ingredient "MyString"
    latin_name "MyString"
    ingredient_definition "MyText"
    avatar1 "MyString"
    avatar2 "MyString"
    avatar3 "MyString"
  end
end
