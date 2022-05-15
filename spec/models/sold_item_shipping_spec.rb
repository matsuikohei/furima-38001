require 'rails_helper'

RSpec.describe SoldItemShipping, type: :model do
  describe 'クレジットカード情報と配送先情報の登録' do
  
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @sold_item_shipping = FactoryBot.build(:sold_item_shipping, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context 'クレジットカード情報と配送先情報を登録できる' do
      it '情報をすべて入力すれば登録できる' do
        expect(@sold_item_shipping).to be_valid
      end

      it '建物名が空でも登録できる' do
        @sold_item_shipping.building = ''
        expect(@sold_item_shipping).to be_valid
      end
    end

    context 'クレジットカード情報と配送先情報を登録できない' do
      it 'userが紐付いてないと購入できない' do
        @sold_item_shipping.user_id = nil
        @sold_item_shipping.valid?
        expect(@sold_item_shipping.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いてないと購入できない' do
        @sold_item_shipping.item_id = nil
        @sold_item_shipping.valid?
        expect(@sold_item_shipping.errors.full_messages).to include("Item can't be blank")
      end

      it 'クレジットカード情報が空では登録できない' do
        @sold_item_shipping.token = ''
        @sold_item_shipping.valid?
        expect(@sold_item_shipping.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空では登録できない' do        
        @sold_item_shipping.postal = ''
        @sold_item_shipping.valid?
        expect(@sold_item_shipping.errors.full_messages).to include("Postal can't be blank")
      end

      it '郵便番号にハイフンが存在しないと登録できない' do        
        @sold_item_shipping.postal = '1234567'
        @sold_item_shipping.valid?
        expect(@sold_item_shipping.errors.full_messages).to include("Postal is invalid")
      end

      it '郵便番号が「4桁ハイフン3桁」では登録できない' do        
        @sold_item_shipping.postal = '1234-567'
        @sold_item_shipping.valid?
        expect(@sold_item_shipping.errors.full_messages).to include("Postal is invalid")
      end

      it '郵便番号が全角文字列では登録できない' do        
        @sold_item_shipping.postal = '１２３ー４５６７'
        @sold_item_shipping.valid?
        expect(@sold_item_shipping.errors.full_messages).to include("Postal is invalid")
      end

      it '都道府県が空では登録できない' do
        @sold_item_shipping.area_id = ''
        @sold_item_shipping.valid?
        expect(@sold_item_shipping.errors.full_messages).to include("Area can't be blank")        
      end

      it '都道府県に「---」が選択されていると登録できない' do
        @sold_item_shipping.area_id = '1'
        @sold_item_shipping.valid?
        expect(@sold_item_shipping.errors.full_messages).to include("Area must be other than 1")        
      end

      it '市区町村が空では登録できない' do
        @sold_item_shipping.city = ''
        @sold_item_shipping.valid?
        expect(@sold_item_shipping.errors.full_messages).to include("City can't be blank")        
      end

      it '番地が空では登録できない' do
        @sold_item_shipping.address = ''
        @sold_item_shipping.valid?
        expect(@sold_item_shipping.errors.full_messages).to include("Address can't be blank")        
      end

      it '電話番号が空では登録できない' do
        @sold_item_shipping.phone = ''
        @sold_item_shipping.valid?
        expect(@sold_item_shipping.errors.full_messages).to include("Phone can't be blank")        
      end

      it '電話番号が9桁の半角数値では登録できない' do
        @sold_item_shipping.phone = '123456789'
        @sold_item_shipping.valid?
        expect(@sold_item_shipping.errors.full_messages).to include("Phone is invalid")        
      end

      it '電話番号が12桁の半角数値では登録できない' do
        @sold_item_shipping.phone = '123456789012'
        @sold_item_shipping.valid?
        expect(@sold_item_shipping.errors.full_messages).to include("Phone is invalid")        
      end

      it '電話番号が全角数値では登録できない' do
        @sold_item_shipping.phone = '１２３４５６７８９１０'
        @sold_item_shipping.valid?
        expect(@sold_item_shipping.errors.full_messages).to include("Phone is invalid")        
      end

      it '電話番号が半角英字では登録できない' do
        @sold_item_shipping.phone = 'abcdefghij'
        @sold_item_shipping.valid?
        expect(@sold_item_shipping.errors.full_messages).to include("Phone is invalid")        
      end

      it '電話番号にハイフンが存在すると登録できない' do
        @sold_item_shipping.phone = '123-4567-8910'
        @sold_item_shipping.valid?
        expect(@sold_item_shipping.errors.full_messages).to include("Phone is invalid")        
      end

    end


  end


end
