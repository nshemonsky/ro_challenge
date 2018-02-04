# flask_app cookbook

The flask_app cookbook installs a demo flask app using Gunicorn as the app
server with Nginx as the front end.

## Cookbook Dependencies

* [application_git](https://github.com/poise/application_git)
* [application_python](https://github.com/poise/application_python)
* [nginx](https://github.com/chef-cookbooks/nginx)
* [poise-build-essential](https://github.com/poise/poise-build-essential)
* [poise-python](https://github.com/poise/poise-python)

## Other Dependencies

The app deployed is located at https://github.com/nshemonsky/demo_flask_app.git.
If this repo is unavailable, deployment of the app will fail.

## Platform Support

* Amazon Linux

## Usage

Call the `flask_app::default` recipe.

## Testing
This cookbook includes linting and automated testing using:

* [Rubocop](http://batsov.com/rubocop/)
* [Foodcritic](http://acrmp.github.io/foodcritic/)
