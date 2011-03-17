require 'test_helper'

class NewDataNotifierTest < ActiveSupport::IntegrationCase
  test "should send mail when there is new users" do
    assert Time.now >= NewDataNotifier::Notifier.get_last_sent_at
    assert NewDataNotifier::Notifier.get_latest_added_data.blank?
    assert NewDataNotifier::Notifier.send_all_notification.blank?
    User.create :email => "a@a.com"
    assert !NewDataNotifier::Notifier.get_latest_added_data.blank?
    assert !NewDataNotifier::Notifier.send_all_notification.blank?
  end
end