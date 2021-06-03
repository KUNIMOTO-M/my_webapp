require 'rails_helper'

RSpec.describe Micropost, type: :request do
let(:user){ create(:user) }
let(:micropost_params) { attributes_for(:micropost) }
let(:invalid_micropost_params) { attributes_for(:micropost, content: "") }

describe "ログインしている場合" do
  before do
    user.confirm
    sign_in user
  end
  context 'パラメーターが妥当な場合' do
    it "contentが存在する時成功すること" do
      expect do
          post microposts_path, params: {micropost: micropost_params}
      end.to change(Micropost, :count).by 1
    end
    it "micropostが成功した時homeに表示させること" do
      post microposts_path, params: {micropost: micropost_params}
      expect(Micropost.last.content).to include("初めまして")
    end

  end
  context 'パラメーターが妥当でない場合' do
    it "contentが存在しない時失敗すること" do
      expect do
      post microposts_path, params: {micropost: invalid_micropost_params}
      end.to change(Micropost, :count).by 0
    end
  end
end

describe "ログインしていない場合" do
  it "ログインしていない場合失敗させること" do 
    expect do
      post microposts_path, params: {micropost: micropost_params}
    end.to change(Micropost, :count).by 0
  end
end
end

