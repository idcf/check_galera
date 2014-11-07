module SpecConfig
  TARGET_HOSTS   = ENV['TARGET_HOSTS'] ? ENV['TARGET_HOSTS'].split(",") : []

  SSH_USER       = ENV['SSH_USER']
  SSH_PASS       = ENV['SSH_PASS']
  SSH_PORT       = ENV['SSH_PORT']
  SSH_KEYS       = ENV['SSH_KEYS'] ? ENV['SSH_KEYS'].split(",") : nil

  CLUSTER_SIZE   = ENV['CLUSTER_SIZE'] || 3
  MYSQL_BIN_PATH = ENV['MYSQL_BIN_PATH'] || "/usr/bin/mysql"
  MYSQL_USER     = ENV['MYSQL_USER'] || "root"
  MYSQL_PASS     = ENV['MYSQL_PASS']
  MYSQL_SERVICE  = ENV['MYSQL_SERVICE'] || "mysql"
end

