+++

title = "7 behaviours to avoid in a software architecture role"
date = "2021-02-02T00:00:00Z"
author = "Daniel Watts"
tags = ["architecture"]
slug = "7-behaviours-to-avoid-software-architect"

+++

Over the years, I've had the opportunity to work in architecture roles alongside experienced software/technical/solution architects. Through observing others and my own trial and error, I've learned a little bit about what _not_ to do in these roles (because it's often easier to reflect on what didn't work rather than what did). Even though I lean towards the idea that everyone should be architecting the system rather than having architects solely responsible - I recognise that some organisations are far from that ideal, and it's those folks I hope find this list helpful. So here it is, 7 behaviours to avoid if you're in a software architecture role:


## 1. Don't ignore the engineering team

If you're not "hands-on" with the engineering team either through writing or reviewing code or deep in the technical discussions, then the likelihood is you aren't close enough to the problems and the individuals on the team. If you're not feeling their pain, then you are probably lacking the empathy and understanding to provide effective guidance. If you find yourself in this position, I would consider beginning with one-on-ones and pairing with engineers as the quickest way to increase empathy and understanding. Then look to participate in feature kick-offs, technical design discussions and code reviews where necessary.


## 2. Don't ignore the domain

It's part of the role to become a domain expert. This knowledge can be used to act as an effective translator between business and engineering. That said, you'll want to avoid being a communication bottleneck too, so it's important to teach, translate and document domain context and business value for the engineering team. This is where techniques like [value-stream mapping](https://www.atlassian.com/continuous-delivery/principles/value-stream-mapping), [event storming](https://en.wikipedia.org/wiki/Event_storming) and [domain-driven design](https://twitter.com/ntcoding/status/1342805885224177666) can really help.


## 3. Don't prescribe or mandate architectures

For the most part, our industry has moved past the notion that a system’s architecture is designed in isolation (or in an ivory tower) and handed-off to engineers to deliver. However, it definitely still happens. Software architecture and development should be inter-weaving activities, with feedback from one influencing the other. Keeping that feedback loop as short as possible will likely lead to better outcomes. So if you would like to design and create more resilient systems and your organisation tends to mandate or prescribe architectures; consider how you can best empower engineers to make sound architecture decisions instead. Working with the engineers to agree on a foundation of architectural principles and accepting that architecture is never done, it should evolve and change over time are good places to begin (see the [Building Evolutionary Architectures](https://www.thoughtworks.com/books/building-evolutionary-architectures) book for more on this).


## 4. Don't just seek architectural consistency

Consistency certainly has a place in organisations that build and maintain many systems in order to to help prevent complexity. In my opinion, it's better to see it as a guideline that will likely have exceptions. Simply seeking or worse, enforcing consistency is a sure-fire way to slow the team down, squash innovation and reduce learning opportunities.


## 5. Don't forget about the current architectural state

It can be useful to model a target architecture based on agreed principles and in collaboration with engineers (see #1 and #3 above). However, it must be founded in all the nuance and understanding of the current architecture. Anything else could lead towards a doomed rewrite, an unhappy team or a failed pitch to some confused engineers. 

On a similar note, I've seen many conversations where stakeholders begin to assume the target state is in fact the current state. This can have significant downsides for the engineering team, for example; a sense of moving too slow, missed tasks that were presumed completed or a lack of appreciation upon completing a large chunk of technical work. Stakeholder discussions about target state may need to include regular reminders about the current state.


## 6. Don't get too attached to the desired architecture

It can be easy to fall into the trap of attaching an opinion to your identity, particularly if you've got the task of providing a technical direction for an engineering team. New information and unforeseen circumstances will emerge, so any target state will 100% change. As these scenarios surface, you will need to keep an open mind to adapt your view and the direction. A fixed view will only hold back progress. As mentioned in #3, the architecture should be going through constant, incremental change.


## 7. Don't let review processes stagnate
As an architect in a large organisation you are likely to be responsible for or actively involved in architectural and security review processes, either as a reviewer or seeking a review. These processes are often change approval reviews that give the green-light for a production release. They can be long and drawn out, unclear in their value, involve reviewers who have zero context, and result in unwanted or unnecessary outcomes; making them the perfect candidates for resisting change. As a more senior figure, an architect should be working hard against that intuition. They should seek to understand the purpose and value of the review process and relay it to others. They should be leading or guiding engineering teams through these processes, particularly for the first time. But most importantly, they should be constantly pushing to [improve, reduce or potentially remove a review process](https://cloud.google.com/solutions/devops/devops-process-streamlining-change-approval) depending on its purpose and added value.

There you have it! Hopefully I'll learn even more things to avoid in future but for now, avoid these and you should be good; or at the very least better than a bunch of scenarios I've witnessed. For more advice on the topic of software architecture, check out these excellent reads too:
*   [The  Architect Elevator](https://martinfowler.com/articles/architect-elevator.html) - Visiting the upper floors
*   [The Elephant in the Architecture](https://martinfowler.com/articles/value-architectural-attribute.html) - Why business value should be treated as an architectural attribute
*   [This book reading list](https://mailchi.mp/4aeb4085ec6a/17-dear-architects?e=65367d58cd) by [Dear Architects,](https://www.deararchitects.xyz/) has five books worth reading, including [Building Evolutionary Architectures](https://www.thoughtworks.com/de/books/building-evolutionary-architectures), and sums them up better than I could. It's also an excellent newsletter.

_Thanks to Vivek Jain, Hugo Nogueira and Robin Weston for reviewing various versions of this post._