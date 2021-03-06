module AwsAlertMonitor
  class Config

    attr_accessor :logger, :file

    def initialize(args={})
      @opts       = args[:opts] ||= Hash.new
      log_level   = args[:log_level]
      self.logger = AwsAlertMonitor::Logger.new :log_level => log_level
      self.file   = load_config_file
    end

    private

    def load_config_file
      config_file = "#{ENV['HOME']}/.aws-alert-monitor.yml"

      if File.exists? config_file
        YAML::load File.open config_file
      else
        { }
      end
    end

  end
end
