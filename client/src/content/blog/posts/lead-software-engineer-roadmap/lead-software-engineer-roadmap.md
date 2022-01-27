# The Roadmap of a Lead Software Engineer

## Experience and knowledge you need to gain to become a Lead Software Engineer

![Cover](/content/blog/posts/lead-software-engineer-roadmap/cover.jpg)
<center>Photo by [Markus Spiske](https://unsplash.com/@markusspiske) on [Unsplash](https://unsplash.com/photos/vrbZVyX2k4I)</center>

Hola! I’m a Lead Software Engineer at [EPAM Systems](https://www.epam.com/). Near half a year ago I was promoted to this title from Senior Software Engineer. I’ve gone a long path to get this position. And now I want to share my experience and thoughts.

I’ve been mostly developing a front-end for the last 2,5 years. So, this tail is written from this perspective.

Take a cup of coffee, and let’s go! ☕

## Preconditions

How to start planning the move to the Lead Engineer title? Firstly, you need to be a Senior Software Engineer with approximately 2 or 3 years of experience. This means you are a seasoned engineer who tackles complex tasks and supports a small group of teammates (1...3 devs).

Also, you should be proactive rather than reactive. This assumes that you are ready to bear the burden of responsibility. You can analyze tasks and communicate with business guys. Every suggestion is confirmed by clear justifications.

Obviously, you need to be an expert at least in one tech. This would be a big advantage to have expertise in some more techs and nitches. This is called a [“T-shape person”](https://jchyip.medium.com/why-t-shaped-people-e8706198e437) — one who has deep knowledge in his main field and some additional knowledge around it.

Do you fit these criteria? Then you are ready!

E.g., my expertise is mainly related to React and everything around it. Also, I had a big experience with PHP and some experience with Node.js. So, I have enough experience to either start a new project or support an existing one.

I’m an active mentor who helps folks to start their IT career from the ground up or to get a promotion. Also, I’m a proactive team member who is ready to take responsibility, plan the development process and support teammates.

Now we are ready to explore required hard and soft skills in detail. Are you ready?

## Hard Skills

As for me, these are the most important skills required for a regular software engineer. I don’t want to underestimate the importance of soft skills. But the main thing developer should do is to produce high-quality code that turns into an app that gives value to folks.

Soft skills are also important. And we will explore them in the next section.

### Programming Paradigms

**Object-Oriented Programming.** You should be a pro on this topic. And it is not only about OOP principles. There are a lot more items you should cover:

- [Patterns and design principles](https://refactoring.guru/)
- Smalltalk-like and Erlang-like OOP
- Bad and good practices
- [Actor model vs OO model](https://stackoverflow.com/questions/41215734/actor-model-vs-object-oriented-model)
- [Elegant Objects](https://www.elegantobjects.org/)

See the [GoF Patterns](https://en.wikipedia.org/wiki/Design_Patterns) book. This is a very useful thing for covering some of these topics on a good level.

[This](https://www.patterns.dev/) is a nice website about patterns. Worth looking at.

And one more [resource](https://github.com/shichuan/javascript-patterns) about JavaScript patterns.

**Functional Programming.** This is an exotic thing for a lot of modern developers. But it becomes more and more popular in the last few years, especially in front-end development. There are topics you need to know as a Lead Software Engineer:

- FP principles and patterns
- Lambda calculus
- Different types of polymorphism
- Laziness vs Eagerness
- Parallel computing

I highly recommend [this book](https://mostly-adequate.gitbook.io/mostly-adequate-guide/) by Professor Frisby.

**Reactive Programming.** Not important but highly recommended knowledge. See RxJS and Akka.

You need to be able to compare different solutions and to choose the most appropriate one taking into account different factors.

### Communication Protocols

Not much to say here. There is a set of topics that you need to know and practice.

- IP, TCP, UDP, TSL
- REST
- [GraphQL](https://graphql.org/)
- WebSocket
- Polling
- [Richardson Maturity Model](https://martinfowler.com/articles/richardsonMaturityModel.html)
- [Open API](https://www.openapis.org/)

### Security

As a Lead Software Engineer, you are responsible for developing a secure app. There are a lot of topics you need to be experienced in. Let’s explore the main ones.

- [OWASP Top 10](https://owasp.org/Top10/)
- Security audit
- Security headers
- Security techniques related to your tech stack

It’s an important block. Don’t neglect it, please.

### Authentication

[This article](https://blog.restcase.com/4-most-used-rest-api-authentication-methods/) will give you some understanding of this topic. Then you can use this information to deepen knowledge. Here may be a lot of framework-specific knowledge. For this reason, I’m not going to elaborate more on this topic.

### Performance

That’s a wrong idea to develop a highly performant app in the early stages. You may ask, why? Emm... At least because the time to market is a more priority thing at this step. But when your app becomes more mature, and it gives revenue, you need to care about performance.

Here is a minimal list of what you need to know.

- [Web Performance](https://developer.mozilla.org/ru/docs/Web/Performance)
- [Web Vitals](https://web.dev/i18n/ru/vitals/)
- Quality Attributes
- [RAIL](https://web.dev/rail/)
- Tools (like [Google Lighthouse](https://developers.google.com/web/tools/lighthouse))
- Performance Budget

You need to extend this list by adding framework-specific topics.

### Frameworks

As a Lead Software Engineer, you should be able to choose the right tooling. E.g., what to choose: React, Angular or Vue? Or anything else? This is an important point of implementing an app as it may speed up or slow down the dev process.

There are some criteria you can use for making a decision:

- Community and popularity
- Learning curve
- Built-in features
- Scalability
- Performance
- and so forth...

You can use services like [“Technology Radar”](https://www.thoughtworks.com/radar) and [“The State of JavaScript”](https://stateofjs.com/).

### Architecture

It’s a huge block. And it’s impossible to fit all the valuable information in several sentences. I will give you the most important points that will help you to start this fun journey.

- [Quality Attributes](https://medium.com/@nvashanin/quality-attributes-in-software-architecture-3844ea482732)
- Non-Functional Requirements
- [MVC, MVP, MVVM](https://levelup.gitconnected.com/mvc-vs-mvp-vs-mvvm-35e0d4b933b4)
- Stateless back-end
- [Serverless](https://www.serverless.com/)
- [Microservices](https://microservices.io/)
- [Microfrontends](https://micro-frontends.org/)

Here should be a bunch of framework-related topics. So, extend this list, please.

[This](https://martinfowler.com/articles/micro-frontends.html) is a nice article about micro frontends by Martin Fowler.

### Testing

It’s impossible to deliver a quality product w/o quality assurance. Lead Engineer should take part in setting up a testing strategy. So, the following topics are worth looking at — even if you don’t plan to dive deep into the QA field.

- Testing patterns (e.g., testing pyramid)
- Testing principles (e.g., FIRST and AAA)
- Testing practices (e.g., TDD, BDD)
- Unit & integration testing
- System & acceptance testing
- Manual testing

### Quality

This block is a continuation of the previous one. As a Lead Engineer, you need to enforce your team to develop quality code. You need to know techniques and tools for how to do it.

Let’s dive into topics.

- Code Quality vs Product Quality
- Static code analyses ([Sonar](https://www.sonarqube.org/), linters)
- Refactoring and Tech Debt
- Code review

### CI/CD

Les’s start from the following basic topics:

- Continuous Improvement
- Continuous Integration
- Continuous Delivery
- Continuous Deployment

Then you can go and learn branching strategies. There are some of them:

- [GitHub Flow](https://docs.github.com/en/get-started/quickstart/github-flow)
- Git Flow
- Feature Branch Workflow
- [Release Flow](http://releaseflow.org/)
- [One Flow](https://www.endoflineblog.com/oneflow-a-git-branching-model-and-workflow)
- [Trunk Based Development](https://trunkbaseddevelopment.com/)

After that, I’d suggest you learn [release strategies](https://harness.io/blog/blue-green-canary-deployment-strategies/).

## Soft Skills

This section is what makes the real difference between Senior and Lead Engineers.

There are a lot of Senior Engineers who are not interested in making more managerial tasks. They may be excellent coders. But only tech expertise can’t make you a good tech leader. This is because you need to know how to:

- organize devs in groups
- discuss requested features with business
- provide devs with tasks
- consult devs during the dev process
- and so on...

### SDLC

It stands for “Software Development Life Cycle”. As a Lead Software Engineer, you will be taking part in setting up the development process. For this reason, you need to know what SDLC is.

There are topics you need to cover in this block:

- Waterfall
- Agile
- Scrum
- Kanban
- Lean
- DoR & DoD

### Work Planning

Lest’s start from estimation techniques:

- Story Points
- T-Shirt Estimation
- Planning Pocker
- [PERT](https://projectmanagementacademy.net/resources/blog/a-three-point-estimating-technique-pert/)
- Bottom-up & Top-bottom Estimation

Also, I’d like to suggest you explore “Risk Management”. It is not required but would be a great item for your portfolio.

I also think that it is reasonable to add the following topics in this section:

- Tasks delegation
- Motivation
- Time management
- Onboarding
- Conflicts solving
- Employee’s performance management

## ...

Actually, it doesn’t look like a complete roadmap. You may want to add more topics and remove some of the suggested ones. And that’s totally fine!

I decided not to overload this article with references. It’s because you can Google and find any info you need.

Feel free to connect with me in case of any questions. I’d be glad to help you create a customized plan of growth.

Let’s keep in touch. Good luck!

## ...

You can find this article in [my Medium blog](https://betterprogramming.pub/lead-software-engineer-roadmap-37b8fc10a93f).
