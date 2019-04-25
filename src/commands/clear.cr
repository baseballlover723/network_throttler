require "../command"

class Clear < Command
  def initialize
    @name = "clear"
    @description = "Clears any wondershaper limits on the network"
  end

  def run
    puts "clearing"
  end
end
