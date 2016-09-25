+++
author = "Isma"
date = "2016-09-23T17:30:31+01:00"
draft = false
keywords = ["web", "hugo"]
tags = ["website", "hugo"]
title = "Building a website (this one) with Hugo (I)"
categories = ["development"]
topics = ["development"]
type = "post"
slug = "building-website-with-hugo"
+++

I did my first personal website back in 1997.
Yes, back in the days of animated gifs and iframes. PHP was next, and I even started using it at work too.
CMSs came after, and I wrote some Drupal modules for many of my customers.
But I was barely using the Content Management features of the thing itself.
Most content was static (hardly ever changed) and then some custom modules.
Not exactly what a CMS should be used for.

Then I learnt about Ruby on Rails, and found an amazing framework for developing web apps. I coded a few static pages and I was in the opposite situation.

So I didn't want to use Wordpress, Drupal or any other CMS for building this simple site, and I have been reading about _static site generators_ and the concept sounded really interesting.
I am an advocate of using *the right tool for the job*, and it's time to practice what I preach.

I googled a bit about the subject, found [many alternatives](https://www.staticgen.com/) and chose [Hugo](http://gohugo.io).
Why? Easy to install, well documented, can be an excuse for learning go and _does what it says on the tin_.
In fact, at the time of writing this paragraph I have not even chosen a theme, so I cannot even preview my changes.
Went to the site, read the [quickstart guide](https://gohugo.io/overview/quickstart/), did a couple of quick and dirty local tests, and started setting up things.

This is how I made this site _happen_

## Let's get started!

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
Next thing is to edit it with my text editor and append some content to the bottom of the file.

Hugo does not ship with a default theme, so now  I need a theme
While I could build one from scratch, a ready made theme will spare me some hours and will make me able to publish the site sooner.
Not to mention that having something that _looks good_ is a plus.
I headed to the themes gallery, browse a bit and chose hyde-y.
The theme's page suggests to git clone it into your themes directory, but nesting git repos is not the best idea.
Git submodules are a better choice in this case (note to self: write a post about git submodules):

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

## Getting things ready for the interwebs

I have to admit that having a web page in my HDD is neat, but quite _useless_. Let's make it available to the world.
First of all, we need to 'undraft' our post so that Hugo will generate it in all its glory.

```sh
hugo undraft content/post/building-this-site.md
```

And now let's generate all the static files that we'll host somewhere:

```sh
hugo
```

All needed files are now generated under ``public``

## Ship it!

Ok. Now we need to publish this somewhere.
[Github pages](https://pages.github.com/) does anything I need.
I have chosen to manage this using two repos:

* [Source code](https://github.com/elbenvenutti/elbenvenutti-hugo)
* [Published files](https://github.com/elbenvenutti/elbenvenutti.github.io)

My plan is to setup [travis](https://travis-ci.com/), but for now it's going to be a bit more rudimentary.

Again, I use a submodule to clone the published files repo under ``public``.
```sh
rm -rf public
git submodule add https://elbenvenutti@github.com/elbenvenutti/elbenvenutti.github.io public
```

And run ``hugo`` again. This generates the files under ``public``, but now public is a clone of our publishing repo.
The changes are published by committing and pushing the submodule:
```sh
cd public
git add .
git commit -m "some decent description here"
git push
cd ..
```

That's it. The site is now published.
