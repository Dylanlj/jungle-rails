# This will guess the User class
FactoryGirl.define do
  factory :product do
    name "cheese maker"
    category {Category.new(name: "lame")}
    price 3424.33
    quantity 5

    trait :no_name do
      name nil
    end
    trait :no_price do
      price nil
    end
    trait :no_quantity do
      quantity nil
    end
    trait :no_category do
      category nil
    end
  end

end
