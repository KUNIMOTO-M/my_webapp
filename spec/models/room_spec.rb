require 'rails_helper'

RSpec.describe Room, type: :request do
  let(:user) { create(:user)}
  let(:other_user) { create(:user)}

  describe "ルームを作成する" do
    before do
      @room = Room.create
      @entry1 = Entry.create(:room_id => @room.id, :user_id => user.id)
      @entry2 = Entry.create(:room_id => @room.id, :user_id => other_user.id)
    end
    context "ログインしている時" do
      it "ログインユーザー同士ならルームが作成できること" do
        expect(@room).to be_valid
      end
      it "userのエントリーを作成できること" do
        expect(@entry1).to be_valid
      end

      it "other_userのエントリーを作成できること" do
        expect(@entry2).to be_valid
      end

      it "userとother_userのエントリールームidが同じこと" do
        expect(@entry1.room_id).to eq @entry2.room_id
      end
    end
    
    context "ログインしていない時" do
      it "自分がログインしていない時エントリーを作れないこと" do
        @entry1.user_id = nil
        expect(@entry1).to_not be_valid
      end
      it "相手がログインしていない時エントリーを作れないこと" do
        @entry2.user_id = nil
        expect(@entry2).to_not be_valid
      end
    end
  end
end
