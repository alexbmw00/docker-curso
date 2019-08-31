# -*- mode: ruby -*-
# vi: set ft=ruby :

vms = {
	'docker1' => {'memory' => '3096', 'cpus' => 2, 'ip' => '10'},
	'docker2' => {'memory' => '3096', 'cpus' => 2, 'ip' => '20'},
	'docker3' => {'memory' => '1024', 'cpus' => 2, 'ip' => '30'}
}

Vagrant.configure('2') do |config|

	config.vm.box = 'ubuntu/bionic64'
	config.vm.box_check_update = false

	vms.each do |name, conf|
		config.vm.define "#{name}" do |k|
		    k.vm.hostname = "#{name}.example.com"
		    k.vm.network 'private_network', ip: "27.11.90.#{conf['ip']}"
		    k.vm.provider 'virtualbox' do |vb|
		    	vb.memory = conf['memory']
		    	vb.cpus = conf['cpus']
		    end
		    k.vm.provider 'libvirt' do |lv|
		    	lv.memory = conf['memory']
		    	lv.cpus = conf['cpus']
		    	lv.cputopology :sockets => 1, :cores => conf['cpus'], :threads => '1'
		    end
		end
	end
    config.vm.provision 'shell', path: 'provision/docker.sh'
end
