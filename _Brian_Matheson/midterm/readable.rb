require 'json'

module Readable
  def read (filename)
    instance_vars = []
    if File.file?(filename)
      File.open(filename, 'r') do |fd|
        while line = fd.gets do
          parts = line.split(' = ')
          self.instance_variable_set(parts[0], JSON.load(parts[1]))
        end
      end
      return true
    end
    return false
  end
end


    
