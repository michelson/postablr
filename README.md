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

  + SEO
    + related posts
    + post title
    + images for SEO
    + Provide meta tags
    + Nofollow external links

# installation

gem install postablr

rake postablr:install:migrations