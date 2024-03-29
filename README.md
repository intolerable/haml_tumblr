`haml_tumblr` => `gem install haml_tumblr`
===

a lovely library for writing tumblr themes with haml
---

2.0: everything now uses `=`, and it's all using the `tumblr :whatever` format -- no more `tumblr_link_tag`

Your theme folder should look something like this:

    tumblr_theme/
      theme.haml
      style.sass or style.scss
      scripts.coffee
      partials/
        _posts.haml
        _posts.scss

Add `- require 'haml_tumblr` to the top of your main template ( `theme.haml` in the example ) and you're ready to go!

`haml_tumblr` lets you do neat stuff like:

    = render :posts
    # inserts 'partials/_posts.haml' into the template
    
    = tumblr :title
    # outputs '{Title}' to the template
    
    = tumblr :posts do
      whatever
    # wraps the block in '{block:Posts}' tags
    
    = link_to 'home', '/'
    = link_to '/' do
      home
    # basically the same as rails' link_to helper
    
    = sass_tag :style
    # converts 'style.sass' to raw css and inserts it into the template
    
    = sass_tag :style
    # same as 'sass_tag', but for scss stylesheets
    
    = coffee_tag :scripts
    # pretty much the previous two with coffeescript
    
    = jquery_tag
    # adds jquery to the template. nothing more, nothing less.
    # you can specify a version of jquery to add, like so:
    = jquery_tag "1.7.2"

Fire up `rake` to get a `gemspec`, which can then be `gem build` and `gem install`'d. Alternatively, just do `gem install haml_tumblr`.
