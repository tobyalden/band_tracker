## Band Tracker

A web app to keep track of bands and the venues they've played at.

Make sure to run ```$bundle install``` to ensure all gems are installed and up to date.

To use this app, first run ```$postgres```. In a new tab (keep postgres running), run ```$rake db:create``` and ```$rake db:migrate``` to recreate the necessary database. Then run ```$ruby app.rb``` and navigate to ```localhost:4567``` to view.

MIT License. Copyright 2015 Toby Alden.
