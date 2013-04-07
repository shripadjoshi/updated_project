# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :additional_claim do
    master_claim_id 1
    product_id 1
    claim_type "MyString"
    research_status "MyString"
    assigned_to 1
    copy_status "MyString"
    copy_assigned_to 1
    chemical_summary "MyText"
    editorial_summary "MyText"
    question "MyText"
    answer "MyText"
    allergy_concerns "MyText"
    other_concerns "MyText"
    chemical_info_from_company "MyText"
  end
end
