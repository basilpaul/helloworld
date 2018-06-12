# hello_chef


TODO: Enter the cookbook description here.


When running each suite ensure that both rspec and serverspec tests work.

All tests are green at the moment of this README!!!

RSPEC
bundle exec rspec

SERVERSPEC
after:
bundle exec kitchen converge 'suite-name'
run:
bundle exec kitchen verify 'suite-name'
