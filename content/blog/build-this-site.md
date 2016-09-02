+++
date = "2016-09-02T17:23:05+01:00"
draft = true
title = "How this site was built"

+++
# Preface

I did my first personal website back in 1997.
Yes, back in the days of animated gifs and iframes. PHP was next, and I even started using it at work too.
CMSs came after, and I wrote quite a bit of Drupal modules for many customers.
But I was barely using the Content Management features of the thing itself. Lots of static content and custom modules.
Not exactly what a CMS should be used for.

And now, the (long due) time has come to have my own website. I didn't want to use Wordpress, Drupal or any other CMS.
I have developed a tendency to use *the simplest thing that does the job*, so it's time to practice what I preach.

Googled a bit about the subject, found [many alternatives](https://www.staticgen.com/) and chose [Hugo](http://gohugo.io).
Why? Easy to install, well documented, does the job.
In fact, at the time of writing this paragraph I have not even chosen a theme, so I cannot even preview my changes.
Went to the site, read the [quickstart guide](https://gohugo.io/overview/quickstart/), did a couple of quick and dirty local tests, and started setting up things.

> **Disclaimer**
> I am going to describe what I did/do while creating *this* site.
> I will be making decisions along the way. Sometimes those decisions will be based on facts, evidence or experience.
> Other times they will be random or arbitrary. They might be right, they might be wrong.

# Publishing the site

That was the second choice to be made. [Github pages](https://pages.github.com/) does anything I need.
I have chosen to manage this using two repos:

* [Source code](https://github.com/elbenvenutti/elbenvenutti-hugo)
* [Published files](https://github.com/elbenvenutti/elbenvenutti.github.io)

My plan is to setup [travis](https://travis-ci.com/), but one step at a time.
For now, the process is going to be manual.

# Let's get started!

Installing Hugo on OsX is as easy as:
```bash
brew update && brew install hugo
```

(create files and start editing this file)


Let's use a theme from the gallery
```
cd themes
git clone https://github.com/devcows/hugo-universal-theme
```

```
hugo server --theme hugo-universal-theme --buildDrafts
```
