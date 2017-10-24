+++
title = "Driftrock's Journey to Continuous Delivery"
date = "2017-03-31T12:00:00Z"
author = "Daniel Watts"
tags = ["ci/cd", "deployment", "continuous-delivery", "change", "driftrock"]
slug = "journey-to-cd"
+++

Over the last year, Driftrock has been on a fairly typical journey - you might have heard it before - we went from manual deployments and an apathy for shipping software to automated and repeatable deployments with a focus on delivering value.

Rather then bore you with yet another post about the merits of Continuous Delivery, though I would like to, I’ll attempt to focus instead on how we achieved this shift. Inspired by the book [More Fearless Change](https://www.amazon.co.uk/d/Books/More-Fearless-Change-Strategies-Making-Ideas-Happen/0133966445) by Mary Lynn Manns & Linda Rising, I’ll do my best to remember the steps we took and more specifically the patterns we continue to use to try and change the team’s behaviours.

## Rolling back the year(s)
First some context, back in June 2016 a change to any of our applications would meander it’s way into production. There was very little awareness of whether a change had been deployed, there was a frustratingly popular branching model that dramatically increased cognitive load and deployments were manually triggered from a developer's machine via Heroku’s CLI.

A new change from development to production looked a bit like this:

![Deployment process before](/img/articles/journey-to-cd/deployment-process-before.png)
<br />_Green - automated step.<br />
Orange - unavoidable manual step or a manual step we’re not (yet) looking to change.<br />
Red - avoidable manual step._

There was also a number of inconsistencies in that deployment process depending on the application. Some didn’t have a staging environment, those that did may or may not have been automatically deployed staging and not all applications had automated tests run on master or any other branches. In short, it was unnecessarily complex, wildly inconsistent with little to no automation. So it’s no surprise that there was a lack of interest from the team when it came to deploying software.

All of the above meant deployments were irregular and risky. More often than not a large batch of changes were pushed live, predictably increasing the likelihood of something going wrong and sometimes removing the ability to safely rollback.

## Baby Steps
I’ll try to explain the steps we took and the relevant patterns we used to improve the scenario described above. At the very bottom of this page there is a reference for the patterns mentioned throughout these steps. Also you can find all the patterns conveniently [listed and described here](http://nebula.wsimg.com/4e8937e14b7a33327914aceddd3b11c0?AccessKeyId=C3C1767177F54BB8BF89&disposition=0&alloworigin=1).

### Step 1 - Involve Everyone
Unconventionally it started by improving our retrospectives. The team needed a platform to discuss problems and suggest improvements (_Involve Everyone_). Though we were having a weekly chat called a retrospective this bared little resemblance to the retrospectives I had seen at several other companies. Originally this meeting was much closer to a weekly status update, it focussed on every day work items and their progress rather then looking at _how we can improve how we work_. Suggesting and then demonstrating a more structured approach to retrospectives (by facilitating the first few retros) had a significant impact on the team beyond Continuous Delivery but one of the early discussion points was around how we deploy our software (_Plant the Seeds_).

### Step 2 - Just Do It
With the team a little uncertain about how a move towards Continuous Delivery might benefit them the next step was a simple one - show them an example (_Just Do It_). I put together a simple HTTP API application with one endpoint that returned ‘200 OK’ and created a deployment pipeline in [Snap CI](https://snap-ci.com/). I tried to mimic how we could treat our regular applications and only tackled the more immediate problems (_Pick Your Battles_); manual deployments and managing multiple branches on deploy. The latter also [reducing the distance](https://trunkbaseddevelopment.com/5-min-overview/) between local development and production. Demonstrating that our deployment process could begin to evolve into this:

![Deployment process step 2](/img/articles/journey-to-cd/deployment-process-after.png)

As you might expect (like with working software) this became a great reference point for demoing and explaining the value of CD and how it compares to what we were doing.

### Step 3 - Trial Run
With that seed planted, a working example and regular problems shipping quality software (only highlighting the severity - _Wake-up Call_) buy-in from the rest of the team was steadily increasing. The next step was to commit the team to moving a real application or two to the new system (_Trial Run_). We took two problematic applications to validate our assumptions as early as possible, created deployment pipelines for them, got them successfully deploying and let that change settle in. At this point I thankfully had some help (_Ask for Help_), making the progress much faster and the potential backlash easier to navigate.

### Step 4 - Persistent PR
One pattern mentioned in the book stood out for me throughout this process - Persistent PR. On reflection this subtly appeared in a number of places, sometimes intentional but often unintentionally. Here’s a breakdown of where it featured:

* We changed our regular stand-up meeting so that it focussed first on what was deployed to production, then staging and then active development - typically known as [Walk the Board](https://blog.matthewbutt.com/2016/05/16/reinvigorating-a-daily-stand-up-by-walking-the-board/). Although indirect, it provides a regular reminder to the team to be focussed first on shipping software and how we can progress work items into production.
* At a weekly company meeting we briefly demoed how we changed our approach to deploying software. Incidentally this came about by chance but it was an opportunity worth taking (_Smell of Success_).
* We started to capture and communicate metrics around the number of deployments to production.
* We introduced a few feedback loops to help the flow of information around deployments:
    * Slack notifications - pushing information about failed builds or successful deployments. This meant developers didn’t need to go looking for the status of their change, it came to them.
    * Release notes - [we started announcing client-facing changes internally](http://tech.driftrock.com/post/release-notes/) as and when they were rolled out. This helped generate interest and discussion around new features from people across the company.
    * Monitoring - something we haven’t fully worked out yet, but we continue to experiment with monitoring and better ways to gather feedback from our production systems.

## So, where are we now?
We’re currently deploying to production around 15 times a week, a good sustainable pace for our size team. We ended up moving approximately 30 projects to Snap CI. We created CD pipelines for a variety of applications; Ruby gems, Elixir packages, static sites hosted on AWS, web applications on Heroku and others hosted in Kubernetes. Everyone on the team takes ownership of ensuring a change they're working on is deployed to production and they work closely with other team members to test the relevant functionality. We’re increasingly reliant on automated tests, [feature toggles](https://martinfowler.com/articles/feature-toggles.html) and backwards compatibility - topics which have featured heavily in our retrospectives.

As a side note, Snap CI didn’t really live up to expectation but even this generated a few positives. After a experiencing several issues we began investing in using [Docker for CI](http://tech.driftrock.com/post/speeding-up-ci-tests-using-docker/) to isolate and take ownership of the build environment. This had many knock-on effects such as using Docker in development and transitioning towards Kubernetes. It also reduced our dependency on our choice of CI/CD tool which soon became really important when [Snap CI announced it was going away](https://blog.snap-ci.com/blog/2017/02/06/2017-02-06-snap-announcement/). Fortunately, we’re now in a much better position to understand what we need, so we’re in the process of moving to [Buildkite](https://buildkite.com) (another article for another time !).

Hopefully that gives you an insight into how we continue to transition towards Continuous Delivery and the patterns that helped us. Our approach continues to evolve as we learn and we recognise that we've still got some way to go. Summarising all of that effort into four steps certainly oversimplifies, to get to where we are now took many months even for our small team. This journey reminded us that a change like this doesn’t happen overnight and it takes lots of small, unremarkable steps in the right direction.


&nbsp;

### Other Helpful Resources
[Linda Rising - Myths And Patterns Of Organisational Change](https://vimeo.com/123616200)<br />
[Continuous Delivery - Jez Humble & Dave Farley](https://www.amazon.com/gp/product/0321601912)<br />
[Continuous Delivery - Going from rags to riches - Hibri Marzook](http://www.hibri.net/2016/06/18/continuous-delivery-rags-to-riches/) <br />
[Trunk Based Development](https://trunkbaseddevelopment.com/)<br />

### Change Patterns Reference
Paraphrasing slightly from the book here’s a selection of patterns I’ve mentioned above:

**Baby Steps** - Take one small step at a time towards your goal.<br />
**Involve Everyone** - Everyone should have an opportunity to make their own contribution.<br />
**Plant the Seeds** - Take every opportunity you can to spark interest in an idea.<br />
**Just Do It** - Don’t wait for the perfect moment, instead take the first baby step and start learning.<br />
**Pick your Battles** - Focus your efforts on the most pressing issues.<br />
**Trial Run** - When there’s reluctance to commit to an idea, suggest an experiment for a short period.<br />
**Wake-up Call** - Point out the issues that create a need for change.<br />
**Ask for Help** - Look for people and resources to help your efforts and encourage involvement.<br />
**Persistant PR** - Keep the new idea in front of everyone, consistently promote it in a variety of ways.<br />
**Smell of Success** - When your efforts produce a visible positive result, treat this as a teaching moment.<br />
