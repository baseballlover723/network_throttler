require "../command"

class Update < Command
  def initialize
    @name = "update"
    @description = "Updates the upload limit using wondershaper"
  end

  def run
    puts "updating"
  end
end
