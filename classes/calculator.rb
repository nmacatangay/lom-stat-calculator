class Calculator
  attr_writer :cwv

  def initialize(cwv)
    @cwv = cwv
    @stats = STAT_SYMBOLS
    @max_level = MAX_LEVEL
  end

  def calculate(hash)
    # Check if levels match max level
    validate_levels(hash)

    # Calculate stat growth from weapon levels
    growth = calculate_growth(hash)

    # Apply stat growth to base stats
    applied_growth = apply_growth(growth)

    # Check if growth goes over threshold
    write_to_result(hash, applied_growth) if validate_growth(applied_growth)
  end

  private

  def validate_levels(weapon_levels_hash)
    total = 0
    weapon_levels_hash.keys.each { |weapon| total += weapon_levels_hash[weapon] }

    raise "Levels must match #{@max_level} -> #{total}" if total != @max_level
  end

  def calculate_growth(weapon_levels_hash)
    blank_hash = build_blank_hash
    weapon_levels_hash.keys.each do |weapon|
      blank_hash.keys.each do |stat|
        blank_hash[stat] += WEAPON_GROWTH[weapon][stat] * weapon_levels_hash[weapon]
      end
    end

    blank_hash
  end

  def build_blank_hash
    blank = {}
    @stats.each do |stat|
      blank[stat] = 0
    end

    blank
  end

  def apply_growth(growth_hash)
    character_stats = BASE_STATS.clone
    growth_hash.keys.each do |growth_stat|
      character_stats[growth_stat] += growth_hash[growth_stat]
    end

    character_stats
  end

  def validate_growth(growth)
    growth.keys.each do |key|
      return false if growth[key] < MINIMUM_STAT
    end

    true
  end

  def write_to_result(hash, applied_growth)
    result_parser = Parser.new(@cwv, 'output.txt', 'output.txt')
    result_parser.write_to_input([hash, applied_growth, '--------------------'])
  end
end
