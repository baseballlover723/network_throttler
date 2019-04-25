require "../command"

class Version < Command
  def initialize
    @name = "version"
    @description = "Displays the version of network_throttling"
  end

  def run
    NetworkThrottling::VERSION
  end
end
