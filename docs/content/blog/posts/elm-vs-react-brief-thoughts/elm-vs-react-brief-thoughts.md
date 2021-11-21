# Elm vs React - Brief Thoughts

### What experienced React developer thinks about Elm

![Cover](https://raw.githubusercontent.com/balovbohdan/balovbohdan.github.io/main/docs/content/blog/posts/elm-vs-react-brief-thoughts/cover.jpg)
<center>Photo by [Sigmund](https://unsplash.com/@sigmund) on [Unsplash](https://unsplash.com/photos/jbwFv4chusE)</center>

I've been playing around the Elm for near 3 months. And now I have some thoughts about this tech that may be useful for someone who is just thinking about whether to choose Elm for developing a project or not. To be short, I can say right now that my opinion chaned a lot since I just started exploring the Elm world.

## Month 1

During the first month I was really excited about this one and thought it may be a good thing for my future projects, and very possible I'd suggested it for business app development at some point. I spent some time reading the doc and exploring basics. And everything looked clear and lovely. But then I started development of my personal blog using Elm...

## Month 2

It was the point when I strongly decided to develop my personnal blog with Elm. There were some reasons for this decision:

- Entirely new tech I've never had experience with.
- Elm is known like a "hipster tech", and it should definitely increase my rating among teammates. (Yeah, rather silly reason. But I want to be honest.)
- It's build upon FP ideas, and I'm very interested in the FP last time.
- I like strange solutions, so just decided to satisfy my ego.

So... It took me much more time I initially expected to make first steps. Actuslly, there are no clear tutorials about starting an app in one evening. Elm is not about quick and ceap solutions - it's about enjoying the process of functional programming. And just because I had free time and had no deadline, I was slowly moving my way and struggling with a lot of non-expected problems.

Please, think about the Elm as for enjoing the process of struggling with a lot of non-expected problems! There are a lot of problems you will face making first steps:

- Routing (url parsers, updating the view depending on a global model).
- Fetching data from back-end.
- HTML and CSS are very different from what you already know!

## Month 3

I was the months of routines. I've done a good progress during this months. And results even got available in the web: I've set up deployment of my blog to GitHub Pages. I still have some minor problems with GitHub Actions, but the main thing is that from this point I was able to publish my posts on my own site rather than on Medium! It was very important for me.

## Month 4

Here I am. Writing this new blog post to my personal blog developed with Elm. Actually, I still have a lot of plans for the future. But now I have the right to formalize some valuable output from my short Elm experience. Hope this will allow you to build a vague picture about this exotic tech.

## ...

## Learning Curve

I'm seasoned developer who was mainly working with mainstream things: PHP (Symphony, Yii), JavaScript (React, TypeScript, Flow), Python, and maybe something else. And for this reason I will start with Elm quickly and easily. And it was a big mistake! Even having small experience with Haskell (just for fun), it was rather hard to start with Elm. And not because of syntax or anything else - because of lack of end-to-end tutorials and docs.

So. Be ready to struggle for a month or two beofore you will start doing something valuable that may be presented to folks. Important thing - don't choose this tech for doing business apps as you can bankrupt your company! The only case you can choose it for a business app is when you have a team experienced with Elm.

Then think about hiring in a case of business growts. I believe it's almost impossible to hire someone for Elm development right from the market! As I know some examples about Closure Script, companies hire engineers and teach them. And learning curve is not so easy. It is a very expensive way, as for me.

## Development Speed

Development speed with Elm is terribly slow. And I say this from that perspective where I'm developing an app for myself. And now imagine you need to lead a team developing business app using this exotic tech. This may get a real software development hell!

On the other side, I think that it is possible to set up component-driven development - this is when you build new features using already existing components. (Think about Storybook from React world.) This may be rather quick and easy for simple apps like blogs. But not sure this will be convenient for UI-heavy business apps.

## Safety

Elm outputs in a really type-safe app. You will never face "Uncaught TypeError: Cannot read property of undefined" error so common for JavaScript. And this is a really big advantage of Elm. On the other hand, this safety means you need to write more complex code. I think that it is possible to develop type-safe apps with TypeScript (in case of following some FP principles such as ["totality"](https://kowainik.github.io/posts/totality).)

## Summary

To sum up, I can say that Elm is not an easy thing. It allows to produce reliable app, but you need to pay for it.

I plan to proceed using Elm for my own purposes. E.g., I want to proceed with my blog development using Elm. But, what about business apps - I still lean to mainstream techs. E.g., React is not so popular just because it was invented by Facebook; it is so widely used because it is rather easy, there are a lot of tools and solutions around it. Think about Relay - one more cool Facebook tech, but not popular because of its complexity and poor community. When it comes to Elm (or something like it) - you need to develop a lot of things by yourself.

But it's still a good idea to use Elm for learning purposes, for instance. It is a functional language, and you can learn a lot useful concepts and approaches from it. A lot of things from Elm may be used in different languages. E.g., "totality" MUST be used in Elm (forced by the compiler), and MAY be used in JavsScript/TypeScript to make code more reliable.

I can elaborate on the FP topic for the whole book. But let's stop here for now. Jjust let me suggest some useful links for you to dive deeper into FP and Elm.

- Official Elm docs: https://elm-lang.org/docs
- Non-official Elm guide: https://elmprogramming.com/
- Professor Frisby's FP guide: https://mostly-adequate.gitbook.io/mostly-adequate-guide/
- Kowainik (about Haskell): https://kowainik.github.io/
- Haskell book: https://haskellbook.com/
- One more Haskell book: http://learnyouahaskell.com/
- My first attempt to write about FP with JavaScript: https://balovbohdan.github.io/#/post/fp-notes-purity-1
