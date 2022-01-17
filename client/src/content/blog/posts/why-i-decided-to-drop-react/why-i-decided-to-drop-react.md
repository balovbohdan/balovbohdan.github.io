# Why I decided to learn Elm and drop React

### About Ramda, Haskell, TypeScript, and Elm

![Tux, the Linux mascot](/content/blog/posts/why-i-decided-to-drop-react/cover.jpg)
<center>Photo by [Dominik Vanyi](https://unsplash.com/@dominik_photography) on [Unsplash](https://unsplash.com/photos/5Fxuo7x-eyg)</center>

Hola! I want to be honest: I’m really bored with React and its ecosystem. How many times a day do you see an “Uncaught TypeError: Cannot read property of undefined” error? Have you ever thought that there are better ways of writing code that doesn’t crash in production? This is the topic I’ve been exploring for near a year, and here are my explorations.

## Ramda

It started for me from the Ramda. It is a nice JavaScript library with a lot of useful functions. This allows, and sometimes even enforces you to write composable code. This is when you develop independent pieces of code, and then compose them using the “compose” function to produce a valuable result.


I’m still using this lib on an everyday basis. And I recommend it for you if you want to start writing composable software. Surely, it is not an ideal solution, and there are problems like understanding complex code compositions and sometimes even performance.

So, I didn’t solve the core problem — “Cannot read property of undefined”. This is because we need a good solution to make code static analyses. And here I decided to go to the next step…

## TypeScript

Yeah, it is on the hype. There are a lot of talks and articles around it. And it is really a nice thing to write more safe and even self-descriptive code. This looks much better compared to using Ramda with pure JavaScript: type annotations, interfaces, and even static code analyses!

This is what I wanted — to check code in compile-time and find possible issues before it goes to production. It solves this problem rather well: you can find type mismatches. But to prevent runtime crashes you need to go deeper and follow good practices:

- work properly with object modifications
- follow the totality principle
- use “Maybe” and “Either” monads

The first point looks straightforward — make a shallow copy before object modification. But what about the other two ones?

**Totality principle.** Shortly, this is when you guarantee that your function doesn’t throw an error and always returns a value of an expected type. [Let me direct you here for more details.](https://kowainik.github.io/posts/totality)

**Maybe & Either monads.** These monads are powerful things. They allow you to wrap empty values and errors respectively with a wrapper that prevents runtime crashes and recovers your application from an unexpected situation. To be more correct, an error is an expected situation in a safe application: it is a good thing to plan outstanding situations. And “Monad” and “Either” wrappers allow you to do this planning. [Go here for more details.](https://mostly-adequate.gitbook.io/mostly-adequate-guide/ch08)

And, as you can see, I’m still not pleased with that TypeScript provides for the type safety. So I went on to find better solutions, but not solutions that are on the hype and imposed on me by the industry.

## Haskell

Honestly, I got interested in Haskell just to understand functional programming on some classical examples. I didn’t have a plan to write production code in Haskell. And I can recommend it to you to learn Haskell. It is a good thing to try something different. And Haskell is very different compared to what I did on my everyday programming stuff during the last several years.

I’m still on my way to understanding Haskell. I think there are a lot of useful concepts we can carry to the JavaScript world.

## Elm

I heard about it a lot. I wanted to try it. And I even started reading official docs several times, and then gave up because I thought it was wasting of time. But today I started reading docs again, and now it is a serious intention. After some Haskell experience, I see all the power of languages like Elm:

- easy to learn and start building an app
- implements basic FP concepts: currying, Hindley-Milner notation, composition, and so forth
- supports static code analyses and provides tools for keeping type safety

I think this list could be expanded a lot. But there are the most visible items for me after the path I have already passed. This looks like a good tech that will help me to build reliable apps that don’t crash in runtime. And I see a new long way in front of me with new concepts and things I’m going to learn. And I believe Elm is not the last standpoint in this way.

## Summary

Surely, I’m not going to drop React entirely. React is a powerful lib to build nice UIs quickly. And there is a huge community that I like. And a lot of interesting projects, of course. But for me, this doesn’t mean it is a finish. It is just a start, as approaches for building UIs are developing, and looks like it is slowly going to the functional programming… So maybe techs like Elm, Svelte, and others — are the future of the front-end world.

Good luck, guys!
