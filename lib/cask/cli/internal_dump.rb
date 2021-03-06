class Cask::CLI::InternalDump < Cask::CLI::InternalUseBase
  def self.run(*arguments)
    retval = dump_casks(*arguments)
    # retval is ternary: true/false/nil
    if retval.nil?
      raise CaskError.new("nothing to dump")
    elsif ! retval
      raise CaskError.new("dump incomplete")
    end
  end

  def self.dump_casks(*cask_names)
    Cask.debug = true            # Yuck. At the moment this is the only way to make dumps visible
    count = 0
    cask_names.each do |cask_name|
      begin
        cask = Cask.load(cask_name)
        count += 1
        cask.dumpcask
      rescue StandardError
        opoo "#{cask} was not found"
      end
    end
    count == 0 ? nil : count == cask_names.length
  end

  def self.help
    "Dump the given Cask in YAML format"
  end
end
