# Postablr

Postablr is a mountable blog engine for rails 3

but is a work in progress, don´t use in production!

## Niceties

+ Devise compatible
+ Tumblr style for post types (image, text, video, quote)
+ Sanitize html
+ feed generation (RSS)
+ Rich text editor support (redactor)
+ tagging support - depend on acts_as_taggable_on


+ TODO
  + blogs support if many blogs in site
  + auto save (draft)
  + disqus integration
  + SEO
    + related posts
    + post title
    + images for SEO
    + Provide meta tags
    + Nofollow external links
  + Pages
  + Categories

# installation

gem install postablr

### install migrations
rake postablr:install:migrations

### initializer setup
rails g postablr:install

### postablr views
rails g postablr:views