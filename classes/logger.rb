gem 'awesome_print'
require 'awesome_print'

class Logger
  attr_writer :cwv

  def initialize(cwv)
    @cwv = cwv
  end

  def count(id, index, total)
    ap "#{Time.new.strftime('%m-%d %H:%M:%S')} | CWV: #{@cwv} | #{id}: #{index} of #{total}"
  end

  def note(string)
    ap "#{Time.new.strftime('%m-%d %H:%M:%S')} | CWV: #{@cwv} | #{string}"
  end
end
