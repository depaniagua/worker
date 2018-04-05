require 'test_helper'

class ConfirmationEmailMailerTest < ActionMailer::TestCase
  test "uploaded" do
    mail = ConfirmationEmailMailer.uploaded
    assert_equal "Uploaded", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
