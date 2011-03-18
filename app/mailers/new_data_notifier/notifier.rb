module NewDataNotifier
  class NoFileFound < StandardError; end

  class Notifier < ActionMailer::Base
    # methods for setting configs
    class << self
      def default_recipients=(recipients)
        @@recipients = recipients
      end

      def default_recipients
        @@recipients ||= []
      end

      def be_monitored_models=(models)
        @@models = models
      end

      def be_monitored_models
        @@models ||= []
      end

      def sender_address=(address)
        @@sender_address = address
      end

      def sender_address
        @@sender_address ||= %("New Data Notifier" <newdata.notifier@example.com>)
      end

      def default_options
        {
          :sender_address => sender_address,
          :recipients => default_recipients,
          :subject => "[New Data Notification]"
        }
      end

      # used to deliver all notification mails
      def send_all_notification
        data_hash = get_latest_added_data
        # send mail
        unless data_hash.select { |key, value| value.count > 0 }.blank?
          NewDataNotifier::Notifier.notify(data_hash).deliver
        end
      end

      def get_latest_added_data
        # find data
        data_hash = {}
        last_sent_at = get_last_sent_at
        NewDataNotifier::Notifier.be_monitored_models.each do |model|
          data_hash[model.downcase.to_sym] = model.constantize.where("created_at >= ?", last_sent_at).order("created_at DESC")
        end
        data_hash.delete_if { |key, value| value.count == 0 }
        data_hash
      end

      def get_last_sent_at
        time_mark_file_path = File.join(Rails.root, 'tmp', 'last_notification_send_at')
        # read last sent time, if blank, set current time.
        begin
          last_sent_at = Time.parse( File.read(time_mark_file_path) )
          raise "tmp/last_notification_send_at not found" if last_sent_at.blank?
        rescue
          last_sent_at = Time.now
        ensure
          # have to ensure each time after finish send mail should change the last_notification_send_at
          File.open(time_mark_file_path, "w") do |f|
            f.write(Time.now)
          end
        end
        last_sent_at
      end

    end

    # notification event.
    def notify(data_hash)
      @data_hash = data_hash
      options = self.class.default_options
      mail(:to => options[:recipients], :from => options[:sender_address], :subject => options[:subject])
    end

    protected

    helper_method :object_name
    def object_name(obj)
      %w{name title subject email}.each do |col|
        if obj.respond_to?(col.to_sym) and obj.try(col.to_sym).present?
          return "#{obj.class}##{obj.send(col)}"
        end
      end
      "#{obj.class}##{obj.id}"
    end
  end

end