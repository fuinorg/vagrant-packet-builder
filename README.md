# vagrant-packet-builder
Ansible script to build remotely a Vagrant base box or virtual machine (VM).

This is done using [packet.net](https://www.packet.net/) a baremetal cloud provider. Finally a base box is uploaded to Vagrant Cloud or a virtual machine (VM) is uploaded to a file storage like Artifactory.

[![GPLv3 License](http://img.shields.io/badge/license-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0.de.html)

## Prepare your environment
This section describes the steps that are necessary to run this Ansible script locally. You need to execute them only once.

1. Install python and ansible packages on your local system
   ```
   sudo -H pip install packet-python ansible
   ```
2. Clone this repository and change into it
   ```
   git clone git@github.com:fuinorg/vagrant-packet-builder.git
   cd vagrant-packet-builder
   ```
3. Generate a new SSH key for packet.net
   ```
   mkdir .ssh
   ssh-keygen -f .ssh/id_rsa
   ```
4. Add the newly generated public key to packet.net
   * Goto "packet.net / Personal Profile / SSH keys" and press "Add Key"
   * Copy the content of ".ssh/id_rsa.pub" into field "Key", give it a nice "Title" and check "Select all devices"

## Running the script
With this script you can either create a Vagrant base box or a Virtual Machine (VM):
* [Creating a Vagrant base box](README-bb.md)
* [Creating a virtual machine (VM)](README-vm.md)

## Credits
Many thanks to [Arseniy](https://github.com/ashemenev/) who created the base for this scripts. You can hire him as a freelancer at [upwork.com](https://www.upwork.com/freelancers/~018e862d2f68accf3b/) (Only visible to Upwork customers).
