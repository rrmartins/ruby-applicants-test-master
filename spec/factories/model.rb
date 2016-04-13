# This will guess the User class
FactoryGirl.define do
  factory :model do
    name "HB20"
    make_id Make.create
  end
end
