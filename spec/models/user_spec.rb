require 'rails_helper'

RSpec.describe User, type: :request do
  before do
      @user = build(:user)
  end
  let(:user) { create(:user) }
  let(:user_params) { attributes_for(:user) }
  let(:invalid_user_params) { attributes_for(:user, name: "") }


    describe "sign up" do
      # 姓、名、メール、パスワードがあれば有効な状態であること
      it "is valid with a name, email, and password" do
          expect(@user).to be_valid
        end

      # 名がなければ無効な状態であること 
      it "is invalid without a name" do
        user = User.new(name: nil)
        user.valid?
        expect(user.errors[:name]).to include("can't be blank")
      end
      # メールアドレスがなければ無効な状態であること
      it "is invalid without an email address" do
        user = User.new(email: nil)
        user.valid?
        expect(user.errors[:name]).to include("can't be blank")
      end
      # パスワードがなければ無効な状態であること
      it "is invalid without an password" do
        user = User.new(password: nil)
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end
      # パスワードが6文字未満なら無効であること
      it "is invalid with a password less than 6"do
      user = User.new(password: "aaaaa")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
      end
      # 重複したメールアドレスなら無効な状態であること
      it "is invalid with a duplicate email address" 
      # ユーザーのフルネームを文字列として返すこと
      it "returns a user's full name as a string"
    end

    describe 'actionmaierテスト' do
      before do
        ActionMailer::Base.deliveries.clear
      end
      context 'パラメータが妥当な場合' do
        it 'リクエストが成功すること' do
          post user_registration_path, params: { user: user_params }
          expect(response.status).to eq 302
        end
  
        it '認証メールが送信されること' do
          post user_registration_path, params: { user: user_params }
          expect(ActionMailer::Base.deliveries.size).to eq 1
        end
  
        it 'createが成功すること' do
          expect do
            post user_registration_path, params: { user: user_params }
          end.to change(User, :count).by 1
        end
  
        it 'リダイレクトされること' do
          post user_registration_path, params: { user: user_params }
          expect(response).to redirect_to root_url
        end
      end
  
      context 'パラメータが不正な場合' do
        it 'リクエストが成功すること' do
          post user_registration_path, params: { user: invalid_user_params }
          expect(response.status).to eq 200
        end
  
        it '認証メールが送信されないこと' do
          post user_registration_path, params: { user: invalid_user_params }
          expect(ActionMailer::Base.deliveries.size).to eq 0
        end
  
        it 'createが失敗すること' do
          expect do
            post user_registration_path, params: { user: invalid_user_params }
          end.to_not change(User, :count)
        end
  
        it 'エラーが表示されること' do
          post user_registration_path, params: { user: invalid_user_params }
          expect(response.body).to include 'prohibited this user from being saved'
        end
      end
    end

end
