require 'rails_helper'

RSpec.describe Relationship, type: :request do
  let(:user) { create(:user)}
  let(:other_user) { create(:user)}
  let(:user_params) { attributes_for(:user) }
  let(:other_params) { attributes_for(:user) }

    describe "フォローする" do
      let(:user) { create(:user) }
      let(:other_user) { create(:user) }
      let(:relationship) { user.active_relationships.build(followed_id: other_user.id) }
  
      it "フォローに成功すること" do
        expect(relationship).to be_valid
      end
  
      describe "ログインしていない時、失敗すること" do
        it "is invalid without follower_id" do
          relationship.follower_id = nil
          expect(relationship).to be_invalid
        end
        it "ログインしていない時、失敗すること" do
          relationship.followed_id = nil
          expect(relationship).to be_invalid
        end
      end
    end
end
    

