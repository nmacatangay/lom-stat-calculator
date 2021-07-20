class Logic
  def initialize(logger, cwv, other_weapons, previous_parser)
    @logger = logger
    @cwv = cwv
    @calculator = Calculator.new(cwv)
    @other_weapons = other_weapons
    @previous_parser = previous_parser
    @weapons = WEAPON_SYMBOLS
    @main_weapon = MAIN_WEAPON
  end

  def run
    @cwv -= 1
    previous_parser = @previous_parser.clone

    while @cwv >= 0
      # Set filenames for current loop
      input_filename = "files/#{@cwv}-in.txt"
      output_filename = "files/#{@cwv}-out.txt"

      # Initialize current parser
      current_parser = Parser.new(@logger, input_filename, output_filename)

      # Create new hashes from the output of the previous parser
      create_new_hashes(current_parser, previous_parser)

      # Calculate stats from the latest hashes
      calculate_hashes(current_parser)

      # Set up for new loop
      previous_parser = current_parser
      @cwv -= 1
      @logger.cwv = @cwv
      @calculator.cwv = @cwv
    end
  end

  private

  def other_weapons
    @other_weapons ||= @weapons - [@main_weapon]
  end

  def create_new_hashes(current_parser, previous_parser)
    # Read lines from previous parser
    line_count = `wc -l < #{previous_parser.output_file}`.to_i
    File.readlines(previous_parser.output_file).each.with_index(1) do |line, index|
      @logger.count('READ', index, line_count)
      distributed_hashes = distribute_stats(eval(line))
      current_parser.write_to_input(distributed_hashes)
    end

    # Remove duplicates from output file
    current_parser.write_to_output
  end

  def distribute_stats(base_hash)
    distributed_hashes = other_weapons.map do |other_weapon|
      new_hash = base_hash.clone
      new_hash[@main_weapon] = @cwv
      new_hash[other_weapon] += 1

      new_hash
    end
  end

  def calculate_hashes(current_parser)
    # Read lines from current parser
    line_count = `wc -l < #{current_parser.output_file}`.to_i
    File.readlines(current_parser.output_file).each.with_index(1) do |line, index|
      @logger.count('CALC', index, line_count)
      @calculator.calculate(eval(line))
    end
  end
end
