require 'rails_helper'

RSpec.describe Message, type: :request do
  let(:user) { create(:user)}
  let(:other_user) { create(:user)}

  describe "ダイレクトメッセージ" do
    context "ログインしている" do

      before do
        @room = Room.create
        @entry1 = Entry.create(:room_id => @room.id, :user_id => user.id)
        @entry2 = Entry.create(:room_id => @room.id, :user_id => other_user.id)
      end

      it "ルームが作成されているなら、メッセージは作成できること" do
        Entry.where(:user_id => user.id, :room_id => @room.id)
        message = Message.create(user_id: user.id, content: "初めまして", room_id: @room.id)
        expect(message).to be_valid
      end

      it "ルームが作成されていないなら、メッセージは作成できないこと" do
        @room.id = nil
        message = Message.create(user_id: user.id, content: "初めまして", room_id: @room.id)
        expect(message).to_not be_valid
      end
      
      it "メッセージが空の場合は送信できないこと" do
        Entry.where(:user_id => user.id, :room_id => @room.id)
        message = Message.create(user_id: user.id, content: "", room_id: @room.id)
        expect(message).to_not be_valid
      end
    end
  end
end
