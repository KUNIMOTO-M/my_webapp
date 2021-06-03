require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
let(:user){ create(:user) }
  describe "ログインしていない時" do
    it "Homeページが表示されること" do
      get root_path
      expect(response).to have_http_status(200)
    end

    it "新規登録ページが表示されること" do
      get new_user_registration_path
      expect(response).to have_http_status(200)
    end

    it "ログインページが表示されること" do
      get new_user_session_path
      expect(response).to have_http_status(200)
    end

    it "ログインなしではhomeにリダイレクトされること" do
      get notices_path
      expect(response).to have_http_status(302)
      expect(response).to redirect_to new_user_session_path
    end
  end

  describe "ログインしている時" do 
    before do
      user.confirm
      sign_in user
    end

    it "検索ページを表示" do
      get search_notices_path
      expect(response).to have_http_status(200)
    end

    it "掲示板一覧を表示" do
      get notices_path
      expect(response).to have_http_status(200)
    end

    it "メッセージ一覧を表示" do
      get rooms_path
      expect(response).to have_http_status(200)
    end

    it "設定画面を表示"do
      get edit_user_registration_path
      expect(response).to have_http_status(200)
    end

    it "プロフィールを表示" do
      get user_path(user)
      expect(response).to have_http_status(200)
    end
  end
end
