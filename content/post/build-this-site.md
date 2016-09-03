+++
author = "Isma"
date = "2016-09-02T17:23:05+01:00"
description = "building this site with Hugo"
draft = true
keywords = ["web", "hugo"]
tags = ["website", "hugo"]
title = "Building a website (_this one_) with Hugo"
categories = ["development"]
topics = ["development"]
type = "post"
slug = "building-website-with-hugo"
+++

I did my first personal website back in 1997.
Yes, back in the days of animated gifs and iframes. PHP was next, and I even started using it at work too.
CMSs came after, and I wrote quite a bit of Drupal modules for many customers.
But I was barely using the Content Management features of the thing itself.
Most content was static (hardly ever changed) and then some custom modules.
Not exactly what a CMS should be used for.

So I didn't want to use Wordpress, Drupal or any other CMS for building this site.
I have developed a tendency to use *the simplest thing that does the job*, so it's time to practice what I preach.

Googled a bit about the subject, found [many alternatives](https://www.staticgen.com/) and chose [Hugo](http://gohugo.io).
Why? Easy to install, well documented, does the job.
In fact, at the time of writing this paragraph I have not even chosen a theme, so I cannot even preview my changes.
Went to the site, read the [quickstart guide](https://gohugo.io/overview/quickstart/), did a couple of quick and dirty local tests, and started setting up things.

This is how I made this site _happen_

# Let's get started!

Installing Hugo on OsX is as easy as:
```sh
brew update && brew install hugo
```

Let's create a the site structure:
```sh
hugo new site my-new-site
cd my-new-site
hugo new post/build-a-site-with-hugo
```

This has created a basic hugo site structure, and then our first piece of content. This blog post.
It is a markdown file under ``content/post/build-this-site.md``.
Next thing is to edit it with my favourite text editor (vim) and append some content to the bottom of the file.

Hugo does not ship with a default theme, so now  I need a theme
While I could build one from scratch, I would really like to have something that *looks good*.
Not to mention that my _designer abilities_ are way worse than my coding skills.
I headed to the themes gallery, browse a bit and chose hyde-y.
The theme's page suggests to git clone it into your themes directory, but nesting git repos is not the best idea.
git submodules are a better choice in this case (note to self: write a post about git submodules):

```sh
cd themes
git submodule add https://github.com/enten/hyde-y.git
cd ..
```

The page documents the expected options (should go in ``config.toml``). One minute later, I am _finally_ starting my site:

```sh
hugo server -w --buildDrafts
```

I point my browser to [http://localhost:1313] and _voilà_, this site is alive!

# Ship it!

Ok. Now we need to publish this somewhere.
[Github pages](https://pages.github.com/) does anything I need.
I have chosen to manage this using two repos:

* [Source code](https://github.com/elbenvenutti/elbenvenutti-hugo)
* [Published files](https://github.com/elbenvenutti/elbenvenutti.github.io)

My plan is to setup [travis](https://travis-ci.com/), but one step at a time.
For now, the process is going to be manual.
