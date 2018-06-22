# vagrant-packet-builder
[Ansible](https://www.ansible.com/) script to build remotely a Vagrant base box or virtual machine (VM).

This is done using [packet.net](https://www.packet.net/) a baremetal cloud provider. Finally a base box is uploaded to Vagrant Cloud or a virtual machine (VM) is uploaded to a file storage like Artifactory.

[![GPLv3 License](http://img.shields.io/badge/license-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0.de.html)

## Prepare your environment
This section describes the steps that are necessary to run this [Ansible](https://www.ansible.com/) script locally. You need to execute them only once.

1. Install python and [Ansible](https://www.ansible.com/) packages on your local system
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

## Variables
Here is a short explanation of the parameters ("--extra-vars") used for the [Ansible](https://www.ansible.com/) scripts. 

| Name  | Description | Example |
| :---- | :---------- | :------ |
| **git_project_url** | URL where your [Packer](https://www.packer.io/) Git project lives | https://github.com/fuinorg/lubuntu-vagrant-base-box.git | 
| **git_project_key** | Secret token to use for Git project if it's a private repository | None | 
| **cloud_token** | Secret token for V[Vagrant Cloud](https://app.vagrantup.com/) | xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx | 
| **packet_project_name** | Name of the project at [packet.net](https://www.packet.net/) | lubuntu-vagrant-base-box | 
| **packet_project_id** | ID of the project at [packet.net](https://www.packet.net/) | 12345678-1234-1234-1234-123456789abc |
| **packet_plan** | Selects the service plan to provision your device at [packet.net](https://www.packet.net/) | baremetal_0 | 
| **packet_facility** | Location of the [packet.net](https://www.packet.net/) data center | ams1 | 
| **packet_operating_system** | Operating system for [packet.net](https://www.packet.net/) server instance | ubuntu_17_10 | 
| **packet_hostname** | Instance name for server at [packet.net](https://www.packet.net/) | vagrant-builder-1234 | 
| **packet_api_token** | Token for API at [packet.net](https://www.packet.net/) | xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx |
| **packet_key_file** | Public key file used for SSH at [packet.net](https://www.packet.net/) | ./.ssh/id_rsa.pub |
| **ansible_ssh_private_key_file** | **Public key file used for SSH at [packet.net](https://www.packet.net/) | ./.ssh/id_rsa |
| **vmware_serialNumber** | Serial number you received when you shopped a VMware Workstation license | XXXXX-XXXXX-XXXXX-XXXXX-XXXXX |
| **vmware_url** | **URL where you placed a copy of the VMware Workstation installer | https://files.yourcompany-domain-xyz.com/VMware-Workstation-14-Pro-Linux.bundle |
| **bb_no_release** | Enforce that the new version is **not** released at [Vagrant Cloud](https://app.vagrantup.com/). You need to do the release manually afterwards. | true |
| **artifact_version** | Version to use for [Vagrant Cloud](https://app.vagrantup.com/) or the Virtual Machine ZIP file | 1.0.0 |
| **artifact_description** | Version to use for [Vagrant Cloud](https://app.vagrantup.com/) | Updated packages |
| **vagrant_vmware_lic_url** | URL where you placed a copy of the license file you received when you shopped a [Vagrant VMware plugin](https://www.vagrantup.com/vmware) license | https://files.yourcompany-domain-xyz.com/vmware-workstation.lic |
| **vm_name_vmw** | Name to use for a VMware Workstation virtual machine | lubuntu_dev_vmw |
| **vm_name_vbx** | Name to use for a VirtualBox virtual machine | lubuntu_dev_vbx |
| **vm_upload_url** | URL for uploading the virtual machine ZIP archive | https://yourcompany.jfrog.io/yourcompany/files/ |
| **vm_upload_user** | User for virtual machine ZIP archive upload | your-user |
| **vm_upload_pw** | Password for virtual machine ZIP archive upload  | xxxxx |

## Credits
Many thanks to [Arseniy](https://github.com/ashemenev/) who created the base for this scripts. You can hire him as a freelancer at [upwork.com](https://www.upwork.com/freelancers/~018e862d2f68accf3b/) (Only visible to Upwork customers).
