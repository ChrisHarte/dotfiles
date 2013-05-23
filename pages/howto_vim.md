# VIM

    v               visual mode
    Shift + V       visual line
        c           copy
        p           paste
        d           delete

    i               insert mode
    a               insert mode after cursor
    jj              exit insert mode

    ,h              search by filename (commandt)
    ,a              search by content (silver searcher)
    ,n              file tree (nerdtree)

    " + a + p       paste from top register (last copy/cut)
    :reg            show top 10 registers

    ctrl + l        goto end of line (insert mode)

    ctrl + h        goto left split
    ctrl + j        goto bottom split
    ctrl + k        goto top split
    ctrl + l        goto right split

    [[ or gg        goto top of file
    ]] or shift+gg  goto bottom of file

    shift + [       go up 1 paragraph/block
    shift + ]       go down 1 paragraph/block

    ctrl + 0        goto beginning of line (normal)
    ctrl + $        goto end of line (normal)

    F1              toggle paste formatting off/on
    F7              indent entire file based on file-type

    g + g + = + G   reformat entire page (gg jump to top of page, = select from top to bottom, G reformat)

## jumping to help

    :help [subject]

    :help rails-vim


## VIM DIFF

Notes [http://amjith.blogspot.ca/2008/08/quick-and-dirty-vimdiff-tutorial.html](http://amjith.blogspot.ca/2008/08/quick-and-dirty-vimdiff-tutorial.html)

## vim - copy and paste
http://stackoverflow.com/questions/8957523/how-to-simplify-copy-and-paste-in-vim

    " + a + p

## rails.vim

    cursor onto an object [@user] and type 'gf' to jump to that object definition, etc.
    ...gf also understands partials
    ...and routes, so if you gf on edit_user_path it will take you the edit user action.

    RFind         ?

    Rmodel        goto model
    Rcontroller   goto controller
    Rhelper       ...helper
    ... etc, all these have tab complete so hit tab to see a list them or tab-complete to the one you want.

### jumping between the model & unit test

    you can open the model and then type Rittest to jump to it's test.
    ...same with typing Rcontroller, that'll take you to this model/tests related controller

    Rfunctionaltest     jump to functional test
    Rittest             jump to unit test

### splitting windows

    To open one of these controllers/etc. in a split, put V in front of R,

    RVcontroller    open in a horizontal split (side by side)
    RScontroller    open in a vertical split (one on top of each other)

    you can also open them in a new tab using T

    RTcontroller    open in a tab

### running tests

    inside a test you can type

    Rake    to get vim to run an external call and run this file of tests for you

    this command is aware of not only unit tests but rspec specs and cucumber features.

### generating

    you can also generate objects from inside vim,

    Rgenerate model name:string age:integer
    ...will generate the appropriate model without leaving vim

    Rgenerate migration AddNameToUser name:string
    ...this will not only generate that migration but take you to the newly created file

## snipmate

    in a ruby class you can define new methods easily by typing 'def' then hitting tab (don't space after def) this will add a method name, highlight it and once youve named it will drop you to the next line.

    collection.sel[tab] autocompletes the block definition

    snippets are located in ~/.vim/snippets

    snipmate ships with a load of snippets for many languages, suggest you check them out.

    from inside these files you can define you own snippets (e.g. for adding comments to code for review)

## tags

    first check ctags is installed

    which ctags

    ..now we can generate a file containing all the method names, etc. within our project

    ctags -R --exclude=.git --exclude=log*
    ..this will create a 'tags' file in the root of our project
    ..good idea to add this to your .gitignore file

    add 'set tags=./tags' to your vim file so it knows where to find the tags file

    now goto a method your using, say you want to find where it's defined?
    ctrl+]  ..will jump to its method definition

    even better if you've got rails vendored in your vendor directory as youll have quick
    access to the rails source to check how certain methods work and get a feel for how
    rails works

    you can also type ':tag named_scope' to goto that definition

    you can do wildcard searching with ':tag named_.*'
    ..when you see the results type the number to jump to that definition

## ack

    you can use ack to search recursively for text inside files based on a language with

    ack --ruby controller

    ack --help-types
    ...to see what languages ack supports by using

    use the .ackrc file to configure ack

    you can use ack inside vim by setting

    grepprg=ack "in your .vimrc file

    :grep [command]

    this will popup a list of matches, hit enter to jump to one, you can also do;
      :cn   to goto the next match
      :cp   to goto the previous match

    (you can bind Ctrl+N & Ctrl+P to these to make jumping thru matches quicker)

## tips

    /[param]  search for something in the file

    u       = undo
    ctrl+r  = redo

    ....say i want to change the text inside the speechmarks,
    ....cursor into it and press c+i+" then type your change, this will change-inside the speechmarks.
      hello "some other" word
    ....you can use other delimiters too.

    ...you can also delete around the double-quotes with d+a+"
    ...or delete-around-word  d+a+w

    gg  = top of screen
    gi  = jump to where you were last in insert mode and put you in insert mode
    G   = bottom of screen

## jumps

    vim is good at recording your jumps,

    type :jumps to see where you jumped to

    you can use this to jump between files easier

    ctrl+o      jump to previous position (e.g. out)
    ctrl+i      jump to next position (if you went back, e.g. in)

## t-comment

    t-comment is really good at commenting things out

    highlight what you want then run :TComment to comment it out

