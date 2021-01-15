Vagrant.configure("2") do |config|
  config.vm.define "ubuntu1" do |ubuntu1|
    ubuntu1.vm.box = "bento/ubuntu-20.04"
    ubuntu1.vm.hostname = 'SQLServer'
   
    ubuntu1.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 4096]
      v.customize ["modifyvm", :id, "--name", "ubuntu19"]
    end
 end

  config.vm.define "ubuntu20" do |ubuntu20|
    ubuntu20.vm.box = "bento/ubuntu-20.04"
    ubuntu20.vm.hostname = 'AnsibleController'
    ubuntu20.vm.network "forwarded_port", guest: 80, host: 90


    ubuntu20.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 4096]
      v.customize ["modifyvm", :id, "--name", "ubuntu20"]
    end
  end
end

