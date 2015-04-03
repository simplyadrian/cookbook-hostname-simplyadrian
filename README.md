hostname-nativex Cookbook
=========================
This cookbook sets the hostname on a linux server .

Requirements
------------

#### cookbooks
- `hostfile` - hostname-nativex needs hostfile cookbook providers to update a nodes hostfile.

* Chef 11 or higher

#### Supported OS Distributions
Tested on:

* * CentOS 6.5 & 6.6

Attributes
----------

#### autofs-nativex::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['hostname-nativex']['domain_name']</tt></td>
    <td>String</td>
    <td>The domain name you will be appending to the node.name value to form the FQDN of server.</td>
    <td><tt>teamfreeze.com</tt></td>
  </tr>
</table>

Usage
-----
#### hostname-nativex::default

Just include `hostname-nativex` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[hostname-nativex]"
  ]
}
```

License and Authors
-------------------
Authors: Adrian Herrera (<simplyadrian@gmail.com>)
