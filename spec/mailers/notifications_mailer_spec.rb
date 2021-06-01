require "rails_helper"

describe "sample" do 
  #  グローバルな変数みたいなので毎回クリアする。
  after { ActionMailer::Base.deliveries.clear }

  it "sample" do 
    # メール送る処理
    ActionMailer::Base.deliveries.last #=> #<Mail::Message>
    ActionMailer::Base.deliveries.last.body #=> #<Mail::Body>

    expect(ActionMailer::Base.deliveries.last.body).to match(/wellcom/)
  end
end