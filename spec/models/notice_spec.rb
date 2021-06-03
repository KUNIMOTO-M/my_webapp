require 'rails_helper'

RSpec.describe Notice, type: :request do
  let(:user){ create(:user)}
  let(:notice_params) { attributes_for(:notice)}
  let(:invalid_notice_title){ attributes_for(:notice, notice_title: "")}
  let(:invalid_notice_body){ attributes_for(:notice, notice_body: "")}
  describe "ログインしている場合"do
  before do
    user.confirm
    sign_in user
  end
    context "パラメーターが妥当な場合" do
      it "投稿が成功すること"do
        expect do
          post notices_path, params: {notice: notice_params}
        end.to change(Notice, :count).by 1
      end
    end
    context "パラメーターが妥当でない場合" do
      it "タイトルが存在しない場合投稿できないこと"do
        expect do
          post notices_path, params: {notice: invalid_notice_title}
        end.to change(Notice, :count).by 0
      end
      it "内容が存在しない場合投稿できないこと"do
        expect do
          post notices_path, params: {notice: invalid_notice_body}
        end.to change(Notice, :count).by 0
      end
    end

    
  end
  describe "ログインしていない場合"do
    it "投稿できないこと"do
      expect do
        post notices_path, params: {notice: notice_params}
      end.to change(Notice, :count).by 0
    end
    it "ログインページにリダイレクトされること"do
      post notices_path, params: {notice: notice_params}
      expect(response).to redirect_to new_user_session_path
    end
  end
end
