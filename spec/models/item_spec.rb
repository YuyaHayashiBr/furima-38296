require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  ###############################################################
  #
  # 正常系
  #
  ###############################################################
  describe '【正常系】商品出品機能' do
    context '全パラメータが正常' do
      it "name, detail, category_id, condition_id, shipping_fee_id, prefecture_id, days_delivery_id, price, user_id, imageが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end
  end

  ###############################################################
  #
  # 異常系
  #
  ###############################################################
  describe '【異常系】商品出品機能' do
    context 'パラメータが空の場合' do
      it 'nameが空の場合' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'detailが空の場合' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end
      it 'imageが空の場合' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'userが空(紐づいていない)の場合' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end

    context 'パラメータの内容が不正の場合' do
      it 'category_idが範囲外(0)の場合' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category を入力してください")
      end
      it 'category_idが範囲外(11)の場合' do
        @item.category_id = Category.data.length
        @item.valid?
        expect(@item.errors.full_messages).to include("Category を入力してください")
      end
      it 'condition_idが範囲外(0)の場合' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition を入力してください")
      end
      it 'condition_idが範囲外(7)の場合' do
        @item.condition_id = Condition.data.length
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition を入力してください")
      end
      it 'shipping_fee_idが範囲外(0)の場合' do
        @item.shipping_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee を入力してください")
      end
      it 'shipping_fee_idが範囲外(3)の場合' do
        @item.shipping_fee_id = ShippingFee.data.length
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee を入力してください")
      end
      it 'prefecture_idが範囲外(0)の場合' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture を入力してください")
      end
      it 'prefecture_idが範囲外(48)の場合' do
        @item.prefecture_id = Prefecture.data.length
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture を入力してください")
      end
      it 'days_delivery_idが範囲外(0)の場合' do
        @item.days_delivery_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Days delivery を入力してください")
      end
      it 'days_delivery_idが範囲外(4)の場合' do
        @item.days_delivery_id = DaysDelivery.data.length
        @item.valid?
        expect(@item.errors.full_messages).to include("Days delivery を入力してください")
      end
      it 'priceが範囲外(300 - 1)の場合' do
        @item.price = 300 - 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は¥300〜9,999,999の範囲で入力してください")
      end
      it 'priceが範囲外(9999999 + 1)の場合' do
        @item.price = 9999999 + 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は¥300〜9,999,999の範囲で入力してください")
      end
      it 'priceが全角の場合' do
        # priceはInteger型のため、String型のデータを代入すると0に置き換えられる。
        # 本テストでは、全角文字をInteger型に変換している。
        @item.price = ("あ").to_i
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は¥300〜9,999,999の範囲で入力してください")
      end
    end

  end
end
