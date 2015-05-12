hostname-simplyadrian Cookbook
=========================
This cookbook sets the hostname on a linux server .

Requirements
------------

#### cookbooks
- `hostfile` - hostname-simplyadrian needs hostfile cookbook providers to update a nodes hostfile.

* Chef 11 or higher

#### Supported OS Distributions
Tested on:

* * CentOS 6.5 & 6.6

Attributes
----------

#### autofs-simplyadrian::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['hostname-simplyadrian']['domain_name']</tt></td>
    <td>String</td>
    <td>The domain name you will be appending to the node.name value to form the FQDN of server.</td>
    <td><tt>teamfreeze.com</tt></td>
  </tr>
</table>

Usage
-----
#### hostname-simplyadrian::default

Just include `hostname-simplyadrian` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[hostname-simplyadrian]"
  ]
}
```

License and Authors
-------------------
Authors: Adrian Herrera (<simplyadrian@gmail.com>)
