# hello_chef


This cookbook will deploy the helloworld python app


When running each suite ensure that both rspec and serverspec tests work.

All tests are green at the moment of this README!!!

RSPEC (unit tests)

bundle exec rspec


SERVERSPEC (integration tests)

run:

bundle exec kitchen verify 'suite-name'


Validation

run:

bundle exec kitchen converge 'suite-name'
