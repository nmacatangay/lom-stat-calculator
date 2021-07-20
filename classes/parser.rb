class Parser
  attr_reader :input_file, :output_file

  def initialize(logger, input_file, output_file)
    @logger = logger
    @input_file = input_file
    @output_file = output_file
    create_file_if_does_not_exist(@input_file)
    create_file_if_does_not_exist(@output_file)
  end

  def write_to_input(lines)
    write(@input_file, lines)
  end

  def write_to_output
    @logger.note("Reading input file - #{@input_file}")
    lines = File.readlines(@input_file).uniq
    write(@output_file, lines, false, 'r+')
  end

  def remove_duplicates_slow(_cwv)
    create_file_if_does_not_exist(@input_file)

    counter = 0
    line_count = `wc -l < #{@input_file}`.to_i
    File.readlines(@input_file).each do |input_line|
      counter += 1
      @logger.count('D', counter, line_count)
      write(@output_file, [input_line], false) unless has_duplicates?(input_line)
    end
  end

  private

  def create_file_if_does_not_exist(file)
    File.open(file, 'w') {} unless File.exist?(file)
  end

  def write(file, lines, new_line = true, option = 'a')
    file_handle = File.new(file, option)
    lines.each do |line|
      file_handle.syswrite(line.to_s)
      file_handle.syswrite($/.to_s) if new_line
    end
  end

  def has_duplicates?(input_line)
    create_file_if_does_not_exist(@output_file)

    File.readlines(@output_file).each { |output_line| return true if input_line == output_line }

    false
  end
end
