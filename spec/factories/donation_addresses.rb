FactoryBot.define do
  factory :donation_address do
    postal_code { '123-4567' }
    prefecture { 1 }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    price { 2000 }
  end
end

# Userモデルのテストコードにおいて、確認したいことは以下です。

# 内容に問題ない場合
# すべての値が正しく入力されていれば保存できること
# 内容に問題がある場合
# nameが空だと保存できないこと
# nameが全角日本語でないと保存できないこと
# name_readingが空だと保存できないこと
# name_readingが全角カタカナでないと保存できないこと
# nicknameが空だと保存できないこと
# nicknameが半角でないと保存できないこと

# DonationAddressクラスのテストコードにおいて、確認したいことは以下です。

# 内容に問題ない場合
# すべての値が正しく入力されていれば保存できること
# cityは空でも保存できること
# house_numberは空でも保存できること
# building_nameは空でも保存できること
# 内容に問題がある場合
# postal_codeが空だと保存できないこと
# postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと
# prefectureを選択していないと保存できないこと
# priceが空だと保存できないこと
# priceが全角数字だと保存できないこと
# priceが1円未満では保存できないこと
# priceが1,000,000円を超過すると保存できないこと
# userが紐付いていないと保存できないこと
