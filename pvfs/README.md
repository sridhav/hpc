### PVFS-2 Virtual Cluster

#### Overview

The repository helps you build a basic PVFS virtual cluster. The code uses vagrant and virtualbox to build the virtual cluster. When successfully run the cluster includes
   * 1 - server node
   * 2 - i/o nodes
   * 2 - clients

#### Getting Started
Its pretty much easy to fire up this cluster if the prequistes are properly satisfied

##### Prerequistes

Firstly you need to have [virtualbox](https://www.virtualbox.org/wiki/Downloads) and vagrant(https://www.vagrantup.com/downloads.html) installed in your system, once both are installed you are good to go.

##### Firing up the cluster

* Clone/Dowload this repo and `cd ` into the cloned/downloded repo

* create a directory by name orangefs in the cloned repo

    ```
    mkdir ./orangefs
    ```

* Start up the cluster using vagrant up

    ```
    vagrant up
    ```

As there are 5 VMs that need to be brought up it might take few mins


#### What is Vagrant

Vagrant is a tool that uses Oracle's VirtualBox to dynamically build configurable, lightweight, and portable virtual machines. Vagrant supports the use of either Puppet or Chef for managing the configuration. 