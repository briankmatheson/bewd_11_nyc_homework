require 'json'

module Writable
  def write (filename)
    File.open(filename, 'w') do |fd|
      self.instance_variables.each do |var|
        fd.print var.to_s + ' = '
        fd.puts contents = self.instance_variable_get(var).to_json
      end
    end
  end
end

