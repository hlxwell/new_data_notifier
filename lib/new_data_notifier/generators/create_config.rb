module NewDataNotifier
  class CreateConfig < Rails::Generators::Base
    desc "Add a config file."
    source_root File.expand_path("../templates", __FILE__)

    def create_config_file
      template "new_data_notifier.rb", "config/initializers/new_data_notifier.rb"
    end
  end
end