# How To Reuse Code in React

## Techniques that will help you share React code in a right way

![Cover](/content/blog/posts/how-to-reuse-code-in-react/cover.jpg)
<center>Photo by [Noémi Macavei-Katócz](https://unsplash.com/@noemieke) on [Unsplash](https://unsplash.com/photos/Zsiuja6HQCU)</center>

Hi! I’m a lead software engineer at EPAM Systems, and today I want to write down my thoughts and experience about reusing code in React projects.

I’m working on a cool project with a very big frontend codebase, and most of it is React. I face code reusability problems every day, and there are some techniques that I widely and successfully use. This is why I have all rights to consult you on this subject.

Maybe you already know some or all techniques and principles from this writing. Anyway, I hope this will give you some useful information that will help you increase the quality of your codebase.

Let’s go!

## A Tale of Confronting DRY and AHA

You should already know this design principle — Don’t Repeat Yourself. Right? This sounds absolutely clear and reasonable: code duplications must be avoided. But where are boundaries? Should we avoid every code duplications we face? What is the minimal code size that should be made shared and reusable?

It’s a tricky question, you know. And I would suggest you be careful with the DRY principle as it can make your code unsupportable at all. But what is the problem here?

Have you ever heard about the AHA design principle? This abbreviation stands for Avoid Hasty Abstractions. [There is a great article](https://kentcdodds.com/blog/aha-programming) by [Kent C. Dodds](https://kentcdodds.com/) about this principle. In short, it warns you on using a lot of abstractions. But what is abstraction? This is a shared and reusable piece of code that was hidden under the unified interface to prevent code duplications!

But, where is the truth, you may ask? From one side you hear that you should avoid duplicated code, and from another — that you should avoid abstractions (i.e., shared code). To answer this question, we need to dive deeper…

## A Tale of Harmonious DRY and AHA

In this section, we are going to look for a balance. Because this is the main thing in the debates about reusability and supportability. Let’s start with a green light for sharing a piece of code.

**Step 1: a new feature.** Just imagine that you are in the middle of developing a new “awesome-feature-1” for your project. And as a part of this feature, you add file uploading functionality: this consists of the “FileDropArea” React component and the “FileUploader” helper class. Implementation details are not interesting for us in this context — just conceptual things.

```
app
├── features
.   ├── awesome-feature
    .   ├── index.js
        ├── container.js
        ├── component.js
        ├── file-frop-area
        .   ├── index.js
            ├── container.js
            ├── component.js
            ├── file-uploader.js
            .
```

It is obvious in this step that making any code shared is not a good idea. So, we can move on.

**Step 2: one more new feature.** And now you are in the middle of developing the “awesome-feature-2” after some time. And you need to have a file drop area here as well as in the previous. What are your actions! In most similar situations, folks are going to make the “file-drop-area” component shared. And in my opinion, it is completely wrong! This is a good example of a hasty abstraction — when you don’t know all possible use cases and try to share a piece of code.

So, what to do in this case? Please, just make a copy of the file-drop-area component for the “awesome-feature-2.” This copy may have some differences from the initial example, and this is absolutely OK — you don’t need to share anything on this step.

**Step 3: and one more new feature.** And the same again: new “awesome-feature-3” with file-drop-area. Let me be concise. This is that desired moment to make the file-drop-area shared. You need to develop a unified API for this shared React component and reuse it in all features containing this functionality.

How would you organize it? This is my suggestion.

```
app
├── features
.   ├── shared
    │   ├── file-frop-area
    │   .   ├── index.js
    │       ├── container.js
    │       ├── component.js
    │       ├── file-uploader.js
    │       .
    ├── awesome-feature-1
    ├── awesome-feature-2
    ├── awesome-feature-3
    .
```

## Wrong Abstractions

And now you may ask how to recognize hasty abstractions and avoid them. You should look at that article by [Kent C. Dodds](https://kentcdodds.com/) for details. And there are my points from the top of my head.

**Avoid abstractions on abstractions.** Fewer words and useful examples. Let’s imagine that we have a function to check whether a user is of some type.

```js
const getIsUserOfType = curry((type, user) => user.type === type);

const user = { id: '1', type: 'WRITER' };
```

This is an example of correct usage:

```js
getIsUserOfType('ADMIN', user); // false
getIsUserOfType('WRITER', user); // true
```

And this is an example of the wrong usage, that represents abstraction on abstraction.

```js
const getIsUserOfAdminType = getIsUserOfType('ADMIN');
const getIsUserOfWriterType = getIsUserOfType('WRITER');

getIsUserOfAdminType(user); // false
getIsUserOfAdminType(user); // true
```

Definitely, there are cases where we need to have abstractions on abstractions. But in most cases, such low-level functions like `getIsUserOfType` should not have such abstractions.

**Keep duplicated code under control.** You should know how to duplicate code in the right way. Most probably it’s a good idea to have a clear policy about code duplications in your project.

There are two types of duplicated code:

- Duplicated code that provides flexibility to the feature/app.
- Duplicated code that’s waiting for its time to be made universal and shared.

## How to Share Code?

I don’t want to write a lot of words about React techniques to share code. Why? Just because there are a lot of articles on this topic! There are items you should pay attention to.

**HOC.** This is a standard and the most widely used technique before React hooks were introduced. There are still a lot of useful libs that expose HOCs. You can create your custom ones as well. But consider using hooks.

**React hooks.** This is the best thing you can use to reuse code. I widely use it nowadays.

**Shared components.** The easiest option. We looked at it in the “Step 3: and one more new feature” section. It goes very well in companion with [Storybook](https://storybook.js.org/) and [Bit](https://bit.dev/).


## ...

That’s it!

I started this article during two days in a hospital. It looks more like a set of thesis you can use for diving deeper and adjusting to your needs. Hope this was helpful for you.

Let’s keep in touch.
