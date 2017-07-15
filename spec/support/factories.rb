FactoryGirl.define do


  sequence :title, ["Ones", "Twos", "Threes", "Fours"].cycle do |n|
    "#{n} Title"
  end


  sequence :name do |n|
    "#{n} Name"
  end

  sequence :description, ["Rectum Deep in Cow shit",
     "Go inside and preapre", "Whatever"].cycle do |n|
    "#{n} Desc"
  end


  factory :company do
    name
  end

  factory :category do
    title
  end

  # category_one = create(:category)

  factory :job do
    title
    description
    level_of_interest 5
    company
    city  "Houston"
    category 
  end

end
