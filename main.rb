load './classes/calculator.rb'
load './classes/logger.rb'
load './classes/logic.rb'
load './classes/parser.rb'
load './classes/setup.rb'

load './data/config.rb'

def main
  # Initialize the main hash
  setup = Setup.new
  main_hash = setup.main_hash

  # Get the current weapon value from setup
  cwv = setup.cwv

  # Initialize the logger
  logger = Logger.new(cwv)

  # Initialize the file parser and write the first pair of files
  setup_parser = Parser.new(logger, "files/#{cwv}-in.txt", "files/#{cwv}-out.txt")
  setup_parser.write_to_input([main_hash])
  setup_parser.write_to_output

  # Initialize stat calculator
  calculator = Calculator.new(cwv)

  # Calculate stats of the main hash
  calculator.calculate(main_hash)

  # Run the loop
  logic = Logic.new(logger, cwv, setup.other_weapons, setup_parser)
  logic.run
end

def skip
  # Initialize the main hash
  setup = Setup.new

  cwv = 78

  # Initialize the logger
  logger = Logger.new(cwv)

  # Initialize the file parser based from the current cwv
  setup_parser = Parser.new(logger, "files/#{cwv}-in.txt", "files/#{cwv}-out.txt")

  # Run the loop
  logic = Logic.new(logger, cwv, setup.other_weapons, setup_parser)
  logic.run
end

main
# skip
