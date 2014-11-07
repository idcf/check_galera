require 'serverspec'
require 'pathname'
require 'shellwords'

require File.expand_path("../spec_config", File.dirname(__FILE__))

set :backend, :ssh
set :request_pty, true
set :host, ENV['TARGET']
ssh_options = {}
ssh_options[:user] = SpecConfig::SSH_USER if SpecConfig::SSH_USER
ssh_options[:keys] = SpecConfig::SSH_KEYS if SpecConfig::SSH_KEYS
ssh_options[:port] = SpecConfig::SSH_PORT if SpecConfig::SSH_PORT
set :ssh_options, ssh_options

module Serverspec
  module Type
    def mysql_status(status_name)
      cmd = ""
      cmd << SpecConfig::MYSQL_BIN_PATH
      cmd << " -u#{Shellwords.escape(SpecConfig::MYSQL_USER)}"
      cmd << " -p#{Shellwords.escape(SpecConfig::MYSQL_PASS)}" if SpecConfig::MYSQL_PASS
      cmd << %! -e "show status like '#{status_name}'"!
      cmd << " | tail -1"
      cmd << " | cut -f2"
      command(cmd)
    end
  end
end

include Serverspec::Type
