require 'rails_helper'

RSpec.describe User, type: :model do
  before do
      @user = build(:user)
  end

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
end
