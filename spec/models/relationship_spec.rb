require 'rails_helper'

RSpec.describe Relationship, type: :request do
  describe 'フォローする' do
    let(:user) { create(:user) }
    let(:other_user) { create(:user) }
    let(:relationship) { user.active_relationships.build(followed_id: other_user.id) }

    it 'フォローに成功すること' do
      expect(relationship).to be_valid
    end

    describe 'ログインしていない時' do
      it 'ログインしていない時、失敗すること' do
        relationship.follower_id = nil
        expect(relationship).to be_invalid
      end
      it 'ログインしていない時、失敗すること' do
        relationship.followed_id = nil
        expect(relationship).to be_invalid
      end
    end
  end
end
