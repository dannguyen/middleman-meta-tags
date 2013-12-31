# Middleman-MetaTags

`middleman-meta-tags` is an extension for the [Middleman](//middlemanapp.com) static site generator that adds easy meta tags in a similar opinionated way as 
[Dmytro Shteflyuk's excellent meta-tags for Rails](http://github.com/kpumuk/meta-tags).

This is a work-in-progress. I wanted to familiarize myself with Cucumber for testing and also extending a library like Middleman. Also, [meta-tags](http://github.com/kpumuk/meta-tags) is a great convenience for Rails and it'd be nice to have it for other frameworks too!

## Installation

If you're just getting started, install the `middleman` gem and generate a new project:

```bash
gem install middleman
middleman init MY_PROJECT
```

If you already have a Middleman project: Add `gem "middleman-meta-tags"` to your `Gemfile` and run `bundle install`.


## Configuration

```ruby
activate :meta_tags
```


## Usage

The extension adds new helpers for your templates.

### Setting up your layout

In your `my_layout.erb`, you might do something like this:

```erb
  <head>
    <%= display_meta_tags site: 'Hello world!', description: 'This is the descriptive field' %>
  </head>

  ...

```

Which will render this:

```html
    <head>
        <title>Hello world!</title>
        <meta name="description" content="This is the descriptive field" />
    </head>

    ... 

```


### Configuring tags by page-by-page basis

In a page wrapped by `my_layout.erb`, you can override the site-wide tags using the `title` helper like so:

```erb
---
title: This is my title
---

<h1><%=title current_page.data.title %></h1>

```



```html
<html>
    <head>
        <title>This is my title</title>
        <meta name="description" content="This is the descriptive field" />
    </head>
    <body>
        <h1>This is my title</h1>
    </body>

</html>   
```



## How to Run Cucumber Tests

1. Checkout Repository: `git clone https://github.com/middleman/middleman-meta-tags.git`
2. Install Bundler: `gem install bundler`
3. Run `bundle install` inside the project root to install the gem dependencies.
4. Run test cases: `bundle exec rake test`

## Donate

[Click here to lend your support to Middleman](https://spacebox.io/s/4dXbHBorC3)

## License

Copyright (c) 2013-2014 Dan Nguyen. MIT Licensed

[middleman]: http://middlemanapp.com
