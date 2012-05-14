`haml_tumblr`
===

a lovely library for writing tumblr themes with haml
---

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

    - render :posts
    # inserts 'partials/_posts.haml' into the template
    
    - tumblr_tag :title
    # outputs '{Title}' to the template
    
    - tumblr_tag :posts do
      whatever
    # wraps the block in '{block:Posts}' tags
    
    - sass_tag :style
    # converts 'style.sass' to raw css and inserts it into the template
    
    - sass_tag :style
    # same as 'sass_tag', but for scss stylesheets
    
    - coffee_tag :scripts
    # pretty much the previous two with coffescript
