# flask_app cookbook

The flask_app cookbook installs a demo flask app using Gunicorn as the app
server with Nginx as the front end.

## Cookbook Dependencies

* [application_git](https://github.com/poise/application_git)
* [application_python](https://github.com/poise/application_python)
* [nginx](https://github.com/chef-cookbooks/nginx)
* [poise-build-essential](https://github.com/poise/poise-build-essential)

## Platform Support

Tested and working on Amazon Linux. As such, RHEL family distributions should
be expected to work but no guarantees!

## Usage

The `flask_app::default` recipe should be called in a role or wrapper cookbook to use this cookbook.

## Testing
This cookbook includes linting and automated testing using:

* [Rubocop](http://batsov.com/rubocop/)
* [Foodcritic](http://acrmp.github.io/foodcritic/)
* [ChefSpec](http://code.sethvargo.com/chefspec/)
