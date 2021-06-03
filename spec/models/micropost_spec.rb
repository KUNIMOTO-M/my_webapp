require 'rails_helper'

RSpec.describe Micropost, type: :request do
let(:user){ create(:user) }
let(:micropost_params) { attributes_for(:micropost) }
let(:invalid_micropost_params) { attributes_for(:micropost, content: "") }

context 'パラメーターが妥当な場合' do
  it "contentが存在する成功する" do
  # expect do
      #post microposts_path, params: {content: micropost_params}
    # end.to change(Micropost, :count).by 1
  end
end
# 名がなければ無効な状態であること
it "is invalid without a first name"
# 姓がなければ無効な状態であること
it "is invalid without a last name"
# メールアドレスがなければ無効な状態であること
it "is invalid without an email address"
# 重複したメールアドレスなら無効な状態であること
it "is invalid with a duplicate email address"
# ユーザーのフルネームを文字列として返す
it "returns a user's full name as a string"
end
