describe service(::SpecConfig::MYSQL_SERVICE) do
  it { should be_running }
end

describe mysql_status("wsrep_local_state_comment") do
  its(:stdout) { should match /^Synced$/ }
end

describe mysql_status("wsrep_cluster_size") do
  its(:stdout) { should match /^#{Regexp.escape(::SpecConfig::CLUSTER_SIZE.to_s)}$/ }
end

describe mysql_status("wsrep_cluster_status") do
  its(:stdout) { should match /^Primary$/ }
end

describe mysql_status("wsrep_connected") do
  its(:stdout) { should match /^ON$/ }
end

describe mysql_status("wsrep_ready") do
  its(:stdout) { should match /^ON$/ }
end

