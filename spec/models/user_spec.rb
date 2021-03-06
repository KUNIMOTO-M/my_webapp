require 'rails_helper'

RSpec.describe User, type: :request do
  before do
    @user = build(:user)
  end
  let(:user) { create(:user) }
  let(:user_params) { attributes_for(:user) }
  let(:invalid_user_params) { attributes_for(:user, name: '') }

  describe 'sign up' do
    # 姓、名、メール、パスワードがあれば有効な状態であること
    it 'is valid with a name, email, and password' do
      expect(@user).to be_valid
    end

    # 名がなければ無効な状態であること
    it 'is invalid without a name' do
      user = User.new(name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end
    # メールアドレスがなければ無効な状態であること
    it 'is invalid without an email address' do
      user = User.new(email: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end
    # パスワードがなければ無効な状態であること
    it 'is invalid without an password' do
      user = User.new(password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
    # パスワードが6文字未満なら無効であること
    it 'is invalid with a password less than 6' do
      user = User.new(password: 'aaaaa')
      user.valid?
      expect(user.errors[:password]).to include('is too short (minimum is 6 characters)')
    end
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

  describe 'プロフィールページを編集' do
    before do
      user.confirm
      sign_in user
    end
    context 'パラメーターが存在する場合' do
      it '名前の更新に成功すること' do
        user_name = user.name
        put user_path(user), params: { user: { name: '新しい名前' } }
        expect(user.reload.name).not_to eq user_name.to_s
      end

      it 'imageの更新に成功すること' do
        put user_path(user),
            params: { user: { image: Rack::Test::UploadedFile.new(File.join(Rails.root,
                                                                            'spec/fixtures/news-article.jpg')) } }
        expect(user.reload.image).to_not eq nil
      end

      it 'areaを更新に成功すること' do
        put user_path(user), params: { user: { area: '北海道' } }
        expect(user.reload.area).to eq '北海道'
      end

      it '自己紹介の更新に成功すること' do
        put user_path(user), params: { user: { introduction: '初めまして。こんにちは。' } }
        expect(user.reload.introduction).to eq '初めまして。こんにちは。'
      end
    end

    context 'パラメーターが空の場合' do
      it '名前の更新に失敗すること' do
        user_name = user.name
        put user_path(user), params: { user: { name: '' } }
        expect(user.reload.name).to eq user_name.to_s
      end

      it 'imageを更新に成功すること' do
        put user_path(user), params: { user: { image: '' } }
        expect(response).to redirect_to show_notice_user_path(user)
      end

      it '自己紹介の更新に成功すること' do
        put user_path(user), params: { user: { introduction: '' } }
        expect(user.reload.introduction).to eq ''
      end
    end
  end
end
