class Setup
  attr_reader :cwv

  def initialize
    @weapons = WEAPON_SYMBOLS
    @main_weapon = MAIN_WEAPON
    @cwv = MAX_LEVEL
  end

  def main_hash
    blank_hash = build_blank_hash
    blank_hash[@main_weapon] = @cwv

    blank_hash
  end

  def other_weapons; end

  private

  def build_blank_hash
    blank = {}
    @weapons.each do |weapon|
      blank[weapon] = 0
    end

    blank
  end
end
