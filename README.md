New Data Notifier
===============

If there is some new users signed up on your site or some new articles been added by some other user, If you hope been notified, please execute "gem install new_data_notifier"

Install
=======

1. Execute "rails generate new_data_notifier:create_config"

2. Change the config in new_data_notifier.rb which placed in initializers dir, below is a sample:

    NewDataNotifier.default_recipients = ["hlxwell@gmail.com"]

    NewDataNotifier.be_monitored_models = ["Job", "Partner"]

    NewDataNotifier.sender_address = ["new_data@gmail.com"]

3. Add cron task.

    */20 * * * * sh -c "cd /home/michael.he/app/current && rake new_data_notifier:send_latest_data RAILS_ENV=production"

TO-DO-LIST
==========

1. Monitored Models should be able to configured like below:

  NewDataNotifier.be_monitored_models = ["Job.waiting_to_approve", "PaymentTransaction.waiting_to_process"]


Copyright
=========
Copyright (c) 2010 Michael He, released under the MIT license