Vagrant.configure("2") do |config|

  config.vm.hostname = "nodejs-app-berkshelf"

  # Default to using Ubuntu, unless specified otherwise
  case ENV['VMBOX']
    when 'centos64'
      config.vm.box = "CentOS-6.4-x86_64-minimal"
      config.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130427.box"
    else
      config.vm.box = "opscode-ubuntu-12.04"
      config.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_chef-11.2.0.box"
  end

  config.omnibus.chef_version = :latest

  config.vm.network :private_network, ip: "33.33.33.10"

  config.ssh.max_tries = 40
  config.ssh.timeout   = 120

  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      :mysql => {
        :server_root_password => 'rootpass',
        :server_debian_password => 'debpass',
        :server_repl_password => 'replpass'
      }
    }

    chef.run_list = [
      "recipe[nodejs_app::default]"
    ]
  end
end
