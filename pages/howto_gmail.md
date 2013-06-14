## Google Apps, Secondary Domain Gmail Catchall

There is another way to create a catch-all address that will work for secondary domains. The steps are these:

1- Log into google.com/a/domain.com.
2- Click on the 'Google Apps' icon.
3- Click on 'Gmail.'
4- Click on 'Advanced settings.'
5- You will see different tabs, click on 'Default routing.'
6- Click on 'Add setting.'
7- On the new window under step 1 select 'Pattern match.'
8- Under 'Regexp' type in '.+@domain.co'
9- On step 2 under 'Headers'

- Add a check mark to 'Add X-Gm-Original-To header'
- Add a check mark to 'Add X-Gm-Spam header'

10- Under 'Envelope recipient'

- Add a check mark to Change envelope recipient
- Click on 'Replace recipient' and type the address that you would like to use as the catch all address for that domain.

11- Under step 3 select 'Perform this action only on non-recognized addresses.'
12- Click on 'Save.'
