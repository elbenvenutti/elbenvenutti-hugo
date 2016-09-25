+++
author = "Isma"
date = "2016-09-24T09:43:22+01:00"
description = "description"
draft = true
keywords = ["hugo", "travis", "github", "coninuous", "integraton"]
tags = ["web", "continuous integration", "travis", "deployment"]
title = "Automating deployment with travis"
topics = ["continuous integration", "travis"]
type = "post"

+++
Managing two separate repositories for something that is effectively a single entity is prone to human error.
In this particular case, one of the repositories holds the generated files that result from running ``hugo`` on the other repository.
As commented when [setting up this site]({{% ref "post/build-this-site.md" %}}), I would like to automate the generation and publishing of this site as much as possible.

There are lots of ways of achieving this, and [travis](https://travis-ci.org/) is something that has been on my to-do list for a long time.
The workflow I want to implement is:

- Whenever I want to create content or edit my themes, etc... I create a new branch on the [source repository](https://github.com/elbenvenutti/elbenvenutti-hugo).
- I do my changes there, verify them on a local environment, etc...
- One I'm happy, commit, push and merge that branch to the master branch on that repo
- Travis fetches the changes, runs ``hugo`` to generate the files
- Travis commits and pushes the generated files to the [published repository](https://github.com/elbenvenutti/elbenvenuttii.github.io)

## Getting rid of our publishing submodule
```bash
git submodule deinit public
git rm public
echo "public" >> .gitignore
git commit -m "removing public submodule"
```
