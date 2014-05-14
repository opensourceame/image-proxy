require File.join(File.expand_path(File.dirname(__FILE__)), "command")

module ImageProxy
  class Identify < ImageProxy::Command
    def initialize(options)
      @options = options
    end

    def execute(user_agent=nil)
      execute_command %'#{curl @options.source, :user_agent => user_agent} | identify -verbose -'
    end
  end
end