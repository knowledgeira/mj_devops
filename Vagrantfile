Vagrant.configure("2") do |config|
  config.vm.define "ubuntu1" do |ubuntu1|
    ubuntu1.vm.box = "bento/ubuntu-20.04"
    ubuntu1.vm.hostname = 'Server1'
    ubuntu1.vm.network :private_network, ip: "192.168.100.100"
   
    ubuntu1.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 2048]
      v.customize ["modifyvm", :id, "--name", "Server1"]
    end
 end

  config.vm.define "ubuntu2" do |ubuntu2|
    ubuntu2.vm.box = "bento/ubuntu-20.04"
    ubuntu2.vm.hostname = 'Server2'
    #ubuntu2.vm.network "forwarded_port", guest: 80, host: 90
    ubuntu2.vm.network :private_network, ip: "192.168.100.200"



    ubuntu2.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 2048]
      v.customize ["modifyvm", :id, "--name", "Server2"]
    end
  end
end

