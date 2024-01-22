require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できる場合' do
      it '商品の情報を全て入力すると商品出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できない場合' do
      it '商品画像が空では商品出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では商品出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品の説明が空では商品出品できない' do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end
      it 'カテゴリーが空では商品出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が空では商品出品できない' do
        @item.sales_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status can't be blank")
      end
      it '配送料の負担が空では商品出品できない' do
        @item.shipping_fee_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status can't be blank")
      end
      it '発送元の地域が空では商品出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数が空では商品出品できない' do
        @item.scheduled_delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
      end
      it '販売価格が空では商品出品できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is invalid', 'Item price is not a number')
      end
      it '商品名が40文字以上だと商品出品できない' do
        @item.item_name = '商品名が40文字以上だと商品出品できない商品名が40文字以上だと商品出品できない!!'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item name is too long (maximum is 40 characters)')
      end
      it '販売価格が300円以下では商品出品できない' do
        @item.item_price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be greater than or equal to 300')
      end
      it '販売価格が9,999,999円以上では商品出品できない' do
        @item.item_price = '10000001'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be less than or equal to 9999999')
      end
      it '販売価格が半角数値以外では商品出品できない' do
        @item.item_price = '７８９'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end
    end
  end
end
