## SCSS / CSS Markup

* If your only ever going to have block1, block2, block3 consider using ID's and name them after the content type (site-nav-block, article-nav-block).
* If your going to use classes name them after the content type (nav-item, article-summary).
* With SCSS nesting try to keep with the inception rule, Never Go More Than 3 Levels Deep.
* ID & class names should be separated by colons => nav-item
* With styling specific to your app try to namespace it with p-nav-item [p for paypal].
* For header styling add classes .h1, .h2, .h3, .h4, .h5 on top of your usual header styling so you have flexibility where needed.

## HTML / SLIM

* With slim use the ' rather than | to get a trailing space at the end of the line.

## Assets

* All asset names should be lower-case, separated by colons => small-warning.png
* Favour .png for icons, solid graphics, .jpg for people's photos.
* Use tools like [ImageOptim](http://imageoptim.com/) to crush the file size.

## Tables

* There's contention whether paragraph's should be inside tabular data, on this case it's a fair assumption to go with not using p tags inside td elements.

