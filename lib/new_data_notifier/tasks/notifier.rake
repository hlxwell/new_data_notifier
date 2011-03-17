namespace :new_data_notifier do
  desc "send latest data"
  task :send_latest_data => :environment do
    NewDataNotifier::Notifier.send_all_notification
  end
end