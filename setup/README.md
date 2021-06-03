# Setup
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


# Demo app
Yo can access to a live demonstration of this app hosted on heroku in the following link: [Denuncia ciudadana team03](https://denuncia-ciudadana-team03.herokuapp.com/)