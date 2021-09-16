class DonationAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :house_number, :building_name, :price, :user_id
  # Formオブジェクトを用いて保存したい全ての属性について、上記のように指定することで、ゲッターとセッターを定義できる。
  # この様にActiveModel::Modelとattr_accessorを活用することで、Formオブジェクトの属性をform_withメソッドの引数に指定できる様になる。

  # donationモデルとaddressモデルにあるバリデーションの移動
  with_options presence: true do
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000000, message: "is invalid"}
    validates :user_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}

  def save
    # 寄付情報を保存し、変数donationに代入する
    donation = Donation.create(price: price, user_id: user_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, donation_id: donation.id)
  end
end

# donationテーブルに保存されるuser_idには、本体belongs_to:userのアソシエーションによりバリデーションが設定されている。
# すなわち、Donationモデルがインスタンスを保存する際に紐付くユーザー情報がない場合、モデル内のアソシエーションの記述により保存できない。
# しかし、donation_addressクラスにはアソシエーションを定義することはできないため、belongs_toによるバリデーションを行うことができない。
# そこで、donation_addressクラスでuser_idに対してバリデーションを新たに設定した。
