# Shared configuration for Crossbeams apps

The shared config runs as a DRb (Distributed Ruby) service which can be interrogated from several clients.

Config settings are stored in `ConfigEngine` and `shared_config.rb` exposes an instance of it over `DRb`.

## Basic use

To run: `./shared_config.rb`.

To connect from a client:

~~~ruby
require 'drb/drb'

DRb.start_service
remote_object = DRbObject.new_with_uri('druby://localhost:9999')

p remote_object.list_names(:packmat)
p remote_object.list_all_names
p remote_object.config_for(:packmat).inspect
~~~

## To run on a deployed machine

* Modify `shared_config_wrapper.sh` to point to the correct path.
* Modify `crossbeams-shared-config.service`.
* Copy `crossbeams-shared-config.service` to `/etc/systemd/system/crossbeams-shared-config.service`.
* Start: `sudo systemctl start crossbeams-shared-config.service`
* Stop: `sudo systemctl stop crossbeams-shared-config.service`
* Restart: `sudo systemctl restart crossbeams-shared-config.service`
* Check status: `sudo systemctl status crossbeams-shared-config.service`.

## Format of label config hash

The rules for CMS are different from others in that they do not have a `:resolver` (the specification for how to render a variable are set up in the print template fields area in CMS Setup).

The config has sections for various applications (e.g. `:cms` for CMS and `:packmat` for Pack Materials.
Within each section are unique variable names and their attributes. The variable names are what the users interact with and which are stored in NSLD label definitions.

The attributes are:

* `:group` - a name for grouping several variables together.
* `:resolver` - the rule for resolving the variable to a value.
* `:applications` - an array of print applications for which this variable can be used.

The resolver can be:

* A field name
* `BCD:` followed by a barcode rule key
* `FNC:` followed by a function to be called along with its parameters

~~~ruby
BASE_CONFIG = {
  cms: {
    'Custom Variable' => { group: 'Custom', resolver: 'NONE', applications: ['CMS'] },
  },
  packmat: {
    'Location Barcode' => { group: 'Locaton', resolver: 'BCD:location', applications: ['Location'] },
    'Location Code' => { group: 'Locaton', resolver: 'location_code', applications: ['Location'] },
    'Location Description' => { group: 'Locaton', resolver: 'FNC:somefunc,location_description,"ABC"', applications: ['Location'] },
    'SKU Barcode' => { group: 'SKU', resolver: 'BCD:sku', applications: ['Material Resource SKU Barcode'] },
    'Product Variant Code' => { group: 'Product', resolver: 'product_variant_code', applications: ['Material Resource SKU Barcode'] }
  }
}.freeze
~~~
