class State < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :reason, presence: true
  validates :reason, uniqueness: { scope: :user_id }

  enum reason:{
    見るだけ:0,友達募集:1,メッセージOK:2,勉強会しましょう:3,一緒に研究:4,
    情報共有:5,同分野の人募集:6,誰でも歓迎:7
  }
end
