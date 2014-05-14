require File.join(File.expand_path(File.dirname(__FILE__)), "command")

module ImageProxy
  class Compare < ImageProxy::Command
    def initialize(a, b)
      @path_a = to_path(a)
      @path_b = to_path(b)
    end

    def execute
      execute_command %'compare -metric AE -fuzz 10% "#{@path_a}" "#{@path_b}" "#{Tempfile.new("compare").path}"'
    end
  end
end