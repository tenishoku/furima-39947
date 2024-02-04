class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :user_id, :item_id, :order_id, :token

  with_options presence: true do
    # 数字3桁、ハイフン、数字4桁の並びのみ許可する
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }

    validates :city
    validates :addresses
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
    # order_addressクラスにはアソシエーションを定義することはできないため,バリデーションを新たに設定
    validates :user_id
    validates :item_id
  end

  # ジャンルの選択が「---」の時は保存できないようにする
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  #  データをテーブルに保存
  def save
    # 購入情報を保存し、変数orderに代入する
    order = Order.create(item_id:, user_id:)
    # 住所を保存する
    # order_idには、変数orderのidと指定する
    ShippingAddress.create(postal_code:, prefecture_id:, city:, addresses:,
                           building:, phone_number:, order_id: order.id)
  end
end
