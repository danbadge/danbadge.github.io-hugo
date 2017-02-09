+++

title = "Ten deploys a day and still moving slowly"
date = "2013-06-17T00:00:00Z"
author = "Daniel Watts"
tags = ["continuous-delivery", "technical-debt", "cycle-time", "deployment"]
slug = "ten-deploys-a-day-and-still-moving-slowly"

+++

There’s a feeling within my team at [7digital](http://www.7digital.com/) that we’re taking a long time to complete projects or features. Oddly this isn’t something we are currently measuring. We do though measure the [throughput and cycle time](http://blog.robbowley.net/2012/01/06/productivity-throughput-and-cycle-time/) of tasks. Tasks are items of work which the team create as a small iterative step towards a larger feature or story. This is useful for visualising the teams productivity, with the idealistic target of low cycle time and high throughput.

Typically our stakeholders are interested in an estimation and delivery of a project or feature not a task. I was interested to see whether this was something we could measure, with a slant towards having historical data available for helping us estimate. I gathered all the tasks into a spreadsheet going back to the beginning of September 2012 and assigned a descriptive project and feature name I hoped the rest of the organisation could understand. This had the added benefit of forcing me to step back from the implementation and attempt to relate technical items to organisation priorities, something which is far too often overlooked.

This produced some interesting results, which aligned with the team’s fears. Our average lead time of the six planned projects we had completed since September was 160 days. Over half a year! Moreover, this only represents the time it takes for an organisation-wide project to pass-through our team, often there are several teams involved each with their own changes and features to implement. We do roughly two features per project and so it’s a similar story there. On average we’re taking 72 days to complete a feature.

We have our [deployment pipeline](http://martinfowler.com/bliki/DeploymentPipeline.html) at 7digital and deploying changes to production is an absolute breeze. In fact, we’re so good at it we can’t stop talking about it [here](http://prezi.com/2wczo541qzpy/dddea-continuous-delivery-at-7digital/), [here](http://blogs.7digital.com/dev/2012/06/20/evolution-of-deployment-in-7digital/) and [here](http://blogs.7digital.com/dev/2012/04/28/how-we-do-deployments/). So what’s taking us so long to get new features out the door?

## Technical Debt

We have a lot of technical debt. It’s not tested, it’s horribly coupled and entirely confusing, a proper [ball of mud](http://en.wikipedia.org/wiki/Big_ball_of_mud). We try not too but occasionally we touch it and it can slow development down. We’ve been bitten before too where a change we made broke something unrelated in production. We can roll back with ease though so it’s not all that scary and can’t be entirely accountable for our tame pace.

## Bottlenecks

Developing public-facing APIs with numerous existing clients all with their own priorities and ageing implementations presents a challenge in patience and communication. Fortunately, we’ve already made some progress here: In a recent project we needed to migrate a few external API consumers to a new endpoint. We did all the work, communicated the changes and waited. Several months later we started to see some usage only to find out our endpoint wasn’t quite working as expected. To try and mitigate that we have a new policy within our team, dogfooding. We’re now attempting to consume any of our new endpoints we can. There’s two big benefits here: code running in production and failing early.

## Unplanned Projects

Whilst looking back through the data and trying to determine project names, relationships began to emerge between occasional tasks. We found examples of sizeable unplanned projects, not just unplanned tasks, bubbling away in the background. These projects did have clear value and even related back to wider organisational priorities. As a team though we had already committed to other supposedly more important already in-progress projects. Crucially, this results in extended delivery dates on all the projects being worked on.

## Distractions in Parallel

I’ve done the maths and six projects at 160 days each in under a year doesn’t add up. We’ve toyed with a number setups but generally we have two streams and therefore two projects or two features on the go at any one time with a pair on each thing (there’s four of us). This means our focus is constantly shifting between those two items whilst we attempt to give them equal attention. Looking at this further, I attempted to determine the amount of days we spent not working on an ‘in-progress’ feature and in every example it dwarfs the amount of days spent working on the feature. Clearly by spreading ourselves across two things we’re generating much more waste then we realise and unlike technical debt and bottlenecks this is one area where we have much more control.
