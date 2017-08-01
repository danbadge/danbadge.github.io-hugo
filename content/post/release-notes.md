+++
title = "How we do production release announcements at Driftrock"
date = "2016-12-29T16:51:00Z"
author = "Daniel Watts"
tags = ["deployment", "continuous-delivery", "feedback", "driftrock"]
slug = "release-notes-at-driftrock"
+++

At Driftrock we're a small company that has grown from 8 to 18 people in the last 9 months. That's not excessive but it still challenged some existing methods of communication. One of those was how we communicate new features which have recently gone live, somewhere along the way we stopped doing this.
<!--more-->

## Shhh! We're Releasing Software
Previously, we deployed a change to one of our applications and didn't tell anyone unless it solved a particular client issue. This meant we wouldn't seek much feedback on new features and the team's progress and activity was largely unseen by the rest of the company. Bearing in mind that our software is increasingly used internally, this seemed like a real missed opportunity.

## Enter Release Crab
Now we have a dedicated Slack channel for internally announcing the release of new features, bug fixes and other changes. The announcement is typically done by a developer after they push their changes to production as they have the most context. But we're pragmatic with it and don't announce every little change, for example, we might wait until we've finished a sequence of quick deployments. However, [we value feedback](http://tech.driftrock.com/post/tech-values) so we're regularly announcing updates.

Here's an example of a few changes going live for Create (an application for quickly creating ads on Facebook):

![Example release notes](/img/release-notes.png)

(Note the crab emoji - this is now synonymous with release announcements)

This seems like a simple and obvious addition to a production deployment but has had surprising impact, here's a few improvements it's made:

- **Tighter feedback loop** - more communication between the Product Development team (us) and the other teams in Driftrock - Performance Marketing (internal users), Sales and Client Solutions.
- **Increased accountability and ownership** - we could automate these release notes but the personal touch adds an element of accountability, giving the readers a point of contact to field any feedback. Therefore the author needs to understand what's going live and (if necessary) what's happening across the team. Gathering this information is required to help the author distil the announcement into something which is simple and concise.
- **Keeps deployments small** - similarly that small amount of manual overhead for the author gives us yet another reason to keep the batch size of a deployment small and ensure we're releasing software early and often.

## Future Releases
We're still getting used to this process and it will certainly evolve. Early ideas to build on this include automating release notes based on commit messages and working out how we can provide our clients with a similar version, possibly even making these public.

&nbsp;

Update 09/01/2017: Public facing release notes are now available. They are updated every two weeks with the help of our Client Solutions team and you can find them here - http://knowledge.driftrock.com/product-updates
