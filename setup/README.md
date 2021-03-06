# Setup

## Installing
Builded with:
* ruby 3.0.1
* rails 6.1.3.2

To install the app first you need to clone the repository to your local computer. Visit [documentation git clone page](https://docs.github.com/es/github/creating-cloning-and-archiving-repositories/cloning-a-repository-from-github/cloning-a-repository) to more details.
Then you can proceed to install and have up and running with the followings commands:

To install all gems and dependences needed just run:
```bash
bundle install
```
```bash
yarn install
```
The command below creates your database, run migrations and seeds database with initial data. 
```bash
rails db:setup
```

## Required global variables
You need to declare these global variables in your system in order to deploy correctly this app. (only when you are on production environment, you don't need them when you are on development)
- APP_HOST: store the host name of the app.
- SENDMAIL_USERNAME: email used to send confirmation and reset password requests.
- SENDMAIL_PASSWORD: password of the SENDMAIL_USERNAME variable.
- MAIL_HOST: the host of the mail account ex. 'gmail.com'.

**NOTE:** If you use a gmail account to send your emails you may have to enable the 'less secure apps' on your Google Account. You can do it in [here](https://myaccount.google.com/lesssecureapps?pli=1).


# Generating fake data 
If you want to generate fake data to fill in with fake random records the models users, places of interest, and complaints you can run after the initialitation of database, the following command in console:
```bash
rails db:seed:fake_info
```
It can be useful to see the app in action and test all the functionality.
Then you can access with the following credentials:
- email: admin@email.com 
- password: 123456 (the same for all generated users).

# Testing
Just run the command below:
```bash
rspec
```

# Authors
- [ALAN1MACIAS](https://github.com/ALAN1MACIAS)
- [Brayan9105](https://github.com/Brayan9105)
- [brayandiazc](https://github.com/brayandiazc)
- [Carlos-Montiel](https://github.com/Carlos-Montiel)

# Demo app
Yo can access to a live demonstration of this app hosted on heroku in the following link: [Denuncia ciudadana team03](https://denuncia-ciudadana-team03.herokuapp.com/)