require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context 'ユーザー登録が登録できる場合' do
      it 'ユーザー情報が適切に入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context 'Nicknameが登録できない場合' do
      it 'Nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
    end

    context 'emailが登録できない場合' do
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが既に登録されているものは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@がないと登録できない' do
        @user.email = 'kkkkk'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
    end

    context 'passwordが登録できない場合' do
      it 'passwordとpassword_confirmationが空では登録できない' do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'kkk11'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英語のみでは登録できない' do
        @user.password = 'kkkkkk'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが全角英数字では登録できない' do
        @user.password = '１１１１１１'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordとpassword_confirmationが一致していないと登録できない' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'bbb111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end

    context 'ユーザ登録の名前情報が登録できない場合' do
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank", 'Family name is invalid')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", 'First name is invalid')
      end
      it 'family_kanaが空では登録できない' do
        @user.family_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family kana can't be blank", 'Family kana is invalid')
      end
      it 'first_kanaが空では登録できない' do
        @user.first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana can't be blank", 'First kana is invalid')
      end
      it 'family_nameが英語だと登録できない' do
        @user.family_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end
      it 'family_nameが数字だと登録できない' do
        @user.family_name = '111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end
      it 'family_nameが記号だと登録できない' do
        @user.family_name = '¥¥¥'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end
      it 'family_nameが半角文字だと登録できない' do
        @user.family_name = 'ｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end
      it 'first_nameが英語だと登録できない' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'first_nameが数字だと登録できない' do
        @user.first_name = '111'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'first_nameが記号だと登録できない' do
        @user.first_name = '¥¥¥'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'first_nameが半角文字だと登録できない' do
        @user.first_name = 'ｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'family_kanaが英語だと登録できない' do
        @user.family_kana = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family kana is invalid')
      end
      it 'family_kanaが数字だと登録できない' do
        @user.family_kana = '111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family kana is invalid')
      end
      it 'family_kanaが記号だと登録できない' do
        @user.family_kana = '¥¥¥'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family kana is invalid')
      end
      it 'family_kanaが漢字だと登録できない' do
        @user.family_kana = '漢字'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family kana is invalid')
      end
      it 'family_kanaがひらがなだと登録できない' do
        @user.family_kana = 'ひらがな'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family kana is invalid')
      end
      it 'family_kanaが半角かな文字だと登録できない' do
        @user.family_kana = 'ｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family kana is invalid')
      end
      it 'first_kanaが英語だと登録できない' do
        @user.first_kana = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First kana is invalid')
      end
      it 'first_kanaが数字だと登録できない' do
        @user.first_kana = '111'
        @user.valid?
        expect(@user.errors.full_messages).to include('First kana is invalid')
      end
      it 'first_kanaが記号だと登録できない' do
        @user.first_kana = '¥¥¥'
        @user.valid?
        expect(@user.errors.full_messages).to include('First kana is invalid')
      end
      it 'first_kanaが漢字だと登録できない' do
        @user.first_kana = '漢字'
        @user.valid?
        expect(@user.errors.full_messages).to include('First kana is invalid')
      end
      it 'first_kanaがひらがなだと登録できない' do
        @user.first_kana = 'ひらがな'
        @user.valid?
        expect(@user.errors.full_messages).to include('First kana is invalid')
      end
      it 'first_kanaが全角かな文字だと登録できない' do
        @user.first_kana = 'ｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First kana is invalid')
      end
    end

    context 'birthdayが登録できない場合' do
      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
