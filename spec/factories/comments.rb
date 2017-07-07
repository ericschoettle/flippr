FactoryGirl.define do
  factory :comment do
    content "MyComment"
    user_id 1
    photo_id 1
    rating 1
  end
end
