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

p remote_object.list_names('Pack Material')
p remote_object.list_all_names
p remote_object.config_for('Pack Material').inspect
~~~

## To run on a deployed machine

* Modify `shared_config_wrapper.sh` to point to the correct path. _This is done by the Capistrano deploy task._
* Modify `crossbeams-shared-config.service`. _This is done by the Capistrano deploy task._
* Copy `sudo cp crossbeams-shared-config.service /etc/systemd/system/crossbeams-shared-config.service`.
* Enable `sudo systemctl enable crossbeams-shared-config`
* Start: `sudo systemctl start crossbeams-shared-config.service`
* Stop: `sudo systemctl stop crossbeams-shared-config.service`
* Restart: `sudo systemctl restart crossbeams-shared-config.service`
* Check status: `sudo systemctl status crossbeams-shared-config.service`.

## To create systemd init script on a development machine

After cloning the repository, create `shared_config_wrapper.sh` and `crossbeams-shared-config.service` from the template files and adjust the paths to your local path.
```
bundle install

cp shared_config_wrapper.sh.template shared_config_wrapper.sh
sed -i s,'$CURRENT',"$PWD",g ./shared_config_wrapper.sh

cp crossbeams-shared-config.service.template crossbeams-shared-config.service
sed -i s,'$CURRENT',"$PWD",g ./crossbeams-shared-config.service
sed -i s,'$USER',"$USER",g ./crossbeams-shared-config.service
```

Then follow the steps from **Copy** above.

## Format of label config hash

The rules for CMS are different from others in that they do not have a `:resolver` (the specification for how to render a variable are set up in the print template fields area in CMS Setup).

The config has sections for various applications (e.g. `'CMS'` for CMS and `'Pack Material'` for Pack Materials.
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

## Deployment

Use Capistrano (after `master` branch on github has been updated): `bundle exec cap <CLIENT> deploy`.

For initial deployment, run:

* `bundle exec cap <CLIENT> devops:copy_initial`
* `bundle exec cap <CLIENT> deploy:check`
* `bundle exec cap <CLIENT> deploy`

Then make systemd startup script - from the root of the deployed code on the server:

* `sudo cp crossbeams-shared-config.service /etc/systemd/system/crossbeams-shared-config.service`
* `sudo systemctl enable crossbeams-shared-config`
* `sudo systemctl start crossbeams-shared-config`

Note that after each new deployment you need to run `sudo systemctl restart crossbeams-shared-config` for the changed configuration to take effect.
