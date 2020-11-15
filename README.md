
[![Enterprise Modules](https://raw.githubusercontent.com/enterprisemodules/public_images/master/banner1.jpg)](https://www.enterprisemodules.com)

#### Table of Contents

1. [Overview](#overview)
2. [License](#license)
3. [Description - What the module does and why it is useful](#description)
4. [Setup](#setup)
  * [Requirements](#requirements)
  * [Installing the oci_profile module](#installing-the-oci_profile-module)
5. [Usage - Configuration options and additional functionality](#usage)
6. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
7. [Limitations - OS compatibility, etc.](#limitations)

## Overview

The Oracle Cloud Infrastructure (OCI) is an IaaS that delivers on-premise, high-performance computing power to run cloud native and enterprise workloads. You can use Puppet to manage your infrastructure and application resources in the Oracle Cloud Infrastructure. the [`oci_config`](https://www.enterprisemodules.com/shop/products/puppet-oracle-cloud-infrastructure-config) module has all of the basic types and providers to manage OCI resources.

The `oci_profile` module allows an easy way to string all of these resources together. 

## License

Most of the [Enterprise Modules](https://www.enterprisemodules.com) modules are commercial modules. This one is **NOT**. It is an Open Source module. You are free to use it any way you like. 

## Description

The `oci_profile::config` class contains all the Puppet code to install, create and populate an OCI tenancy This class is an easy way to get started. It contains the following steps:

- `tenants`           (Define the tenant(s))
- `compartments`      (define the compartments)
- `identity`          (Define users groups etc.)
- `key_management`    (Define all key related objects)
- `budget`            (Define the budgets)
- `network`           (Define all netweork related OCI objects)
- `block_storage`     (Define volumes and volume backups)
- `object_storage`    (Define buckets)
- `file_storage`      (Define NFS type file storage)
- `instances`         (Define all instances)
- `vms`               (Conveniance class to define VM like objects)

All these stages have a default implementation. This implementation is suitable to get started with. These classed all have parameters you can customize through hiera values. The defaults are specified in the module's `data/default.yaml` file.

But sometimes this is not enough and you would like to add some extra definitions, you can, for example, add a Puppet class to be executed before the `network` is done. You can do this by adding the next line to your yaml data:

```yaml
oci_profile::configuration::before_network:   my_profile::my_extra_class
```
or after:

```yaml
oci_profile::configuration::after_network:   my_profile::my_extra_class
```

If you want to, you can also skip this provided class:

```yaml
oci_profile::configuration::network:   skip
```

Or provide your own implementation:

```yaml
oci_profile::configuration::network:   my_profile::my_own_implementation
```

This mechanism can be used for all named steps and makes it easy to move from an easy setup with a running standard database to a fully customized setup using a lot of your own classes plugged in.

Check [here](https://www.enterprisemodules.com/docs/oci_profile/description.html) to see the full documentation for this module.

## Setup

### Requirements

The [`oci_profile`](https://www.enterprisemodules.com/shop/products/puppet-ora_config-module) module requires:
- Puppet module [`enterprisemodules-oci_config`](https://forge.puppet.com/enterprisemodules/ora_config) installed.
- Puppet module [`enterprisemodules-easy_type`](https://forge.puppet.com/enterprisemodules/easy_type) installed.
- Puppet module [`ipcrm-echo`](https://forge.puppet.com/ipcrm/echo) installed.
- Puppet module [`puppetlabs-stdlib`](https://forge.puppet.com/puppetlabs/stdlib) installed.

- Puppet version 4.0 or higher. Can be Puppet Enterprise or Puppet Open Source
- A valid Enterprise Modules license for usage.
- Runs on most Linux systems.

### Installing the oci_profile module

To install these modules, you can use a `Puppetfile`

```
mod 'enterprisemodules/oci_profile'               ,'0.1.0'
```

Then use the `librarian-puppet` or `r10K` to install the software.

You can also install the software using the `puppet module`  command:

```
puppet module install enterprisemodules-oci_profile
```

## Usage

To get started, include the `oci_profile::configuration` class in your role and add resources to your hiera data.

## Reference

Here you can find some more information regarding this puppet module:

- [The `oci_profile` documentation](https://www.enterprisemodules.com/docs/oci_profile/description.html)

Here are related blog posts:
- [Getting to know the Oracle cloud with Puppet, part 1](https://www.enterprisemodules.com/blog/2020/02/getting-to-know-oracle-cloud-with-puppet-part-1/)

## Limitations

This module only runs on Linux and supports most Linux versions. It requires a puppet version higher than 4. The module does **NOT** run on windows systems.
