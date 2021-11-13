# FP notes #1. Purity

### Notes about Functional Programming with JavaScript

![Cover](https://raw.githubusercontent.com/balovbohdan/balovbohdan.github.io/main/docs/content/blog/posts/fp-notes-purity-1/cover.jpg)
<center>Photo by [Bannon Morrissy](https://unsplash.com/@bannon15?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/photos/iK_3_4l1DB8)</center>

Recently I decided to deepen my knowledge of Functional Programming (next: FP). To get better grasp of this paradigm I decided to make small notes. My everyday programming language is JavaScript, so examples are written in this awesome language. If you think about Haskell when you hear about FP, it is OK. But JavaScript has more friendly infrastructure for everyday coding, and we can freely use it for following either OOP and FP paradigms.

## What is purity?

> Pure function is a function that returns the same output for the same given input, and has no “side effects”.
>
> Side effect is:
> 1) a change of app’s state during result calculation;
> 2) an observable interaction with app outside function during result calculation.

Common example here is comparing of slice and splice methods of array:

```js
const values = [1, 2, 3];

// pure, returns new array
values.slice(0, 2); // [1, 2]

// impure, mutates (changes) input array
// after operation values = [3]
values.splice(0, 2); // [1, 2]
```

Let’s examine one more simple and common example:

```js
const greeting = 'Welcome back';
const greet = name => `${greeting}, ${name}`;
```

In above example function `greet` takes variable `greeting` from outer scope. It breaks rule we outlined above: the same given input has to result into the same output (it is “referential transparency”, we’ll learn it a little bit later). If someone will change `greeting` variable, function `greet` will not be able to produce expected output. Let’s improve this code a bit:

```js
const greet = name => {
  const greeting = 'Welcome back';

  return name => `${greeting}, ${name}`;
};
```

Nice! Now we can consider `greet` function as pure.

**Remember:** we need to prefer pure actions. Code based on pure actions is more readable and maintainable.

## We can’t live without side effects…

- Examples of side effects:
- HTTP call
- changing data at database
- changing files at filesystem
- DOM interactions
- and so forth

As you can see, we can’t live without side effects. Can you imagine complete web application without HTTP calls or DB interactions? Yep, it’s impossible. There is simple workaround where the main idea is to wrap function with side effect with another function:

```js
const fetchUser = (id) => () => fetch(/* ... */);
```

The `fetchUser` is a higher-order function (next: HOF) that returns another function that fetches user using HTTP call. We can consider `fetchUser` as pure function.

> **Higher-order function (HOF)** is a function that takes another function as argument or returns a function. It is very important idea for FP, so keep it in mind.

## Referential transparency

Let’s return to “referential transparency” term we faced above.

> **Referential transparency** means we can substitute function’s call with its output, and it will not change behavior of a program.

It is good thing for optimizations. Let’s examine it on trivial code:

```js
const sum = (x, y) => x + y;
const mult = (x, y) => x * y;
const result = mult(sum(1, 1), sum(1, 2));

// sum(1, 1) = 2
// sum(1, 2) = 3
// mult(sum(1, 1), sum(1, 2)) => mult(2, 3) => 6
```

As you see, we can substitute `mult(sum(1, 1), sum(1, 2))` with just a 6. And it is big power of pure function.

## Why is purity good?

### Caching

Above we introduced “referential transparency” term, and I mentioned that it is good point for optimizations. We can use “memoization” technique to cache results, that prevents calculation output for the same input several times. Here is `memoize` HOF:

```js
const memoize = (fn) => {
  const cache = {};

  return (...args) => {
    const argsStr = JSON.stringify(args);

    cache[argsStr] = cache[argsStr] || fn(...args);

    return cache[argsStr];
  };
};
```

Let’s use it to get `sum` function that caches results:

```js
const sum = (x, y) => x + y;
const sumWithCache = memoize(sum);
```

### Testing

We can easily test pure functions. This topic is beyond the scope of this article. Go and google, if you need more information. 🏄🏿‍♂️

### Parallel code execution

You can freely run pure functions in parallel, and no [race condition](https://en.wikipedia.org/wiki/Race_condition) will break your app. It is actual for Node.js and WebWorkers.

## Summary

You can use pure functions to make your code more readable, maintainable, testable and efficient. Pure functions allows us to use different optimization techniques including memoization and parallel execution.

It is a very quick introduction to pure functions. If you want more information, go and read [this awesome book](https://mostly-adequate.gitbook.io/mostly-adequate-guide/) about FP by Professor Frisby. If you want to get very common picture of FP, just follow my notes: they are good introduction and starting point for your next learnings. Good luck!
