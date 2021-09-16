require 'test_helper'

class DeclarationMailerTest < ActionMailer::TestCase
  test "send_seat" do
    mail = DeclarationMailer.send_seat
    assert_equal "Send seat", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
