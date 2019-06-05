FactoryBot.define do

  factory :item do
    contents        {"これはテスト。テストなのです。"}
    image           {File.open("#{Rails.root}/public/uploads/no_image.jpg")}
    user
  end

end
