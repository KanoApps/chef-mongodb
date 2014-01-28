# install the mongo and bson_ext ruby gems at compile time to make them globally available
gems = 'mongo', 'bson_ext'

gems.each do |g|
  if Gem.const_defined?("Version") and Gem::Version.new(Chef::VERSION) < Gem::Version.new('10.12.0')
    gem_package g do
      action :nothing
    end.run_action(:install)
    Gem.clear_paths
  else
    chef_gem g do
      action :install
    end
  end
end
