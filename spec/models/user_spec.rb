require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、first_nameとlast_name、first_name_kanaとlast_name_kana、birth_dateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth date can't be blank"
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'aok0099'
        @user.password_confirmation = 'aok0098'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'oki9'
        @user.password_confirmation = 'oki9'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid. Include both letters and numbers'
      end
      it 'passwordが英数のみでは登録できない' do
        @user.password = 'passok'
        @user.password_confirmation = 'passok'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid. Include both letters and numbers'
      end
      it 'passwordが全角文字を含む場合は登録できない' do
        @user.password = '全角文字を含む'
        @user.password_confirmation = '全角文字を含む'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid. Include both letters and numbers'
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ）以外は登録できない' do
        @user.first_name = 'first_name'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid. Input full-width characters'
      end
      it 'last_nameが全角（漢字・ひらがな・カタカナ）以外は登録できない' do
        @user.last_name = 'last_name'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name is invalid. Input full-width characters'
      end
      it 'first_name_kanaが全角（カタカナ）以外は登録できない' do
        @user.first_name_kana = '漢字'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana is invalid. Input full-width katakana characters'
      end
      it 'last_name_kanaが全角（カタカナ）以外は登録できない' do
        @user.last_name_kana = 'かんじ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana is invalid. Input full-width katakana characters'
      end
    end
  end
end
