# Setup
## Required global variables
You need to declare these global variables in your system in order to deploy correctly this app. (only when you are on production environment, you don't need them when you are on development)
- APP_HOST: store the host name of the app.
- SENDMAIL_USERNAME: email used to send confirmation and reset password requests.
- SENDMAIL_PASSWORD: password of the SENDMAIL_USERNAME variable.
- MAIL_HOST: the host of the mail account ex. 'gmail.com'.

**NOTE:** If you use a gmail account to send your emails you may have to enable the 'less secure apps' on your Google Account. You can do it in [here](https://myaccount.google.com/lesssecureapps?pli=1).
