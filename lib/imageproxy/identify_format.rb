require File.join(File.expand_path(File.dirname(__FILE__)), "command")

module ImageProxy
  class IdentifyFormat < ImageProxy::Command
    def initialize(file)
      @file = file
    end

    def execute
      result = execute_command %'identify -format "%m" #{@file.path}'
      result.start_with?("identify:") ? nil : result
    end
  end
end