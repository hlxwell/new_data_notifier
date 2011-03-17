module NewDataNotifier
  class Engine < Rails::Engine
    rake_tasks do
      load 'new_data_notifier/tasks/notifier.rake'
    end

    generators do
      require 'new_data_notifier/generators/create_config.rb'
    end
  end
end