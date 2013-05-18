# MAILCHIMP

## (BUG) Hiding content in an email

To hide content in an email (e.g. to affect the preview box in gmail) the obvious answer is to change the text color to be the background color, but there's a problem.
First you can't use display:none and second no matter what you do the text will still be visible, mailchimp breaks like that.

The solution is to place that content inside a user-editable mailchimp region with mc:edit tag, then go into "Edit Layout" select the text and click the "Text Color" button in the tinymce editor then click 'more options in the color popup and specify the hex value of the color you want.
This way mailchimp won't ignore your styling and will make the text invisible.

    <div mc:edit="std_preheader_content">
        my custom subject line
    </div>

## (BUG) Email Links appearing in the default styling in your web-based email client

    *|EMAIL|*

Another caveat is email links generated from mailchimp's email tag, these will be rendered outside your email styling and so will take on the default link style from the email client you are using.

## MC:TAGS

    *|EMAIL|*               send-to email address
    mc:edit="std_...."      editable area (wrap inside tables rather than div's)
    *|ARCHIVE|*             archive link (view email in web browser)

## Unsubscribe Links

    <a href="*|UNSUB|*">unsubscribe</a>

## Can't view this email in...

    Can't see images? &nbsp;<a href="*|ARCHIVE|*" target="_blank">View this email in a web browser</a>

## IF ARCHIVE PAGE

To display something different on the web-version of your email surround it inside these tags:

    *| IF:ARCHIVE_PAGE |*
      content for archive page
    *| ELSE: |*
      content for email version
    *| END:IF |*

## Getting text like mysite.com to not be converted into a link by the email client

There's two ways to do this,

* split the mysite. & com into two elements wrapped in span tags.
* convert mysite.com into unicode, the email client will translate it into text and not be able to translate that into an identifiable url.

Please note option 2 isn't a surefire win as some email clients (ipad, outlook latest) will make it into a link regardless of your efforts.

### Unicode Converters

[http://www.pinnacledisplays.com/unicode-converter.htm](http://www.pinnacledisplays.com/unicode-converter.htm)
[http://www.branah.com/unicode-converter](http://www.branah.com/unicode-converter)

## Email Guides

* [Email Design Guidelines](http://www.campaignmonitor.com/resources/will-it-work/guidelines/)
* [CSS Inliner](http://beaker.mailchimp.com/inline-css)
