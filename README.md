Example App for Professor Charles Xavier and the Mutants.

## Installation

1. Create a configuration file in config/application.yml
   
   You should copy the content in application.example.yml and fill it accordingly.
   Alternatively change admin name and email in config/secrets.yml

2. Create a database configuration file in config/database.yml
   You can use database.example.yml as a base.

3. Run bundle and rake configuration tasks

        bundle --without production
        rake db:create
        rake db:migrate
        rake db:seed

4. Start the local server pointing at localhost:3000

        rails s

5. Start using the app. The credentials are set up in the previous configuration.
