# Vagrant Workspace Manager

This plugin allows you to save and load workspace configuration files. These configuration files simplify the workflow of switching git branches, when you work on multiple projects at once.

## Installation

Install the plugin with a typical Vagrant procedure:

```sh
$ vagrant plugin install vagrant_workspace
```

## Usage

Example vagrant configuration:
```ruby
Vagrant.configure("2") do |config|
  config.workspace.absolute_path = '/adjust' # default is '/home/vagrant'
end
```

Example workspace file:
```yml
# workspaces/master.yml
dashboard:
  checkout: master
accounts:
  checkout: master
```

Available commands:
```sh
$ vagrant workspace checkout master
$ vagrant workspace pull master
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/adjust/vagrant_workspace.
