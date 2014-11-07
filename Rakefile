require 'rake'
require 'rspec/core/rake_task'

require File.expand_path("../spec_config", __FILE__)

def normalize_hostname(hostname)
  hostname.downcase.gsub(/\./, "_").to_sym
end

task :default => "spec:all"

namespace :spec do
  SpecConfig::TARGET_HOSTS.each do |host|
    RSpec::Core::RakeTask.new(normalize_hostname(host), :host) do |t, args|
      puts "Serverspec: #{args[:host]}"
      ENV['TARGET'] = args[:host]
      t.pattern = 'spec/mysql_spec.rb'
    end
  end

  desc "Run serverspec all hosts"
  task :all do
    SpecConfig::TARGET_HOSTS.each do |host|
      Rake::Task["spec:#{normalize_hostname(host)}"].invoke(host)
    end
  end
end

