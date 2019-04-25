require "option_parser"
require "./command"
require "./commands/*"

class Parser
  COMMANDS = initialize_commands

  def self.initialize_commands
    commands = {} of String => Command
    [Clear.new, Update.new, Version.new].each do |command|
      commands[command.name] = command
    end
    commands
  end

  def self.parse!
    option_parser = OptionParser.parse! do |parser|
      parser.banner = "network_throttling version: #{COMMANDS["version"].run}\n" +
                      "Usage: [command] [command arguments]\n" +
                      "#{COMMANDS.values.join('\n')}"
      #   parser.on("-command", "subcommand") { upcase = true }
      #   parser.on("-t NAME", "--to=NAME", "Specifies the name to salute") { |name| destination = name }
      parser.on("-h", "--help", "Show this help") { puts parser }
      parser.on("-v", "--version", COMMANDS["version"].description) { COMMANDS["version"].run }
      parser.unknown_args do |args|
        next if args.empty?
        command_str = args.first
        if COMMANDS.has_key? command_str
            puts COMMANDS[command_str].run
        else
            puts "Unknown command \"#{command_str}\" use \"--help\" to see all avaliable commands"
        end
      end
      parser.invalid_option do |flag|
        STDERR.puts "ERROR: #{flag} is not a valid option."
        STDERR.puts parser
        exit(1)
      end
    end
  end
end
