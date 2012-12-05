FactoryGirl.define do
  factory :post do
    date { Date.today }
    title 'title'
    body 'body'
  end
end