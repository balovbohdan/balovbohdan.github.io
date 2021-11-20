# Medical app idea

## Formalization of my thoughts about medical pet project

![Cover](https://raw.githubusercontent.com/balovbohdan/balovbohdan.github.io/main/docs/content/blog/posts/fp-notes-purity-1/cover.jpg)
<center>Photo by [Thought Catalog](https://unsplash.com/@thoughtcatalog) on [Unsplash](https://unsplash.com/photos/V4EbkXA2iw8)</center>

Hola! I’m software developer who likes pet projects. Now I’m working at EPAM. When I have free time I learn modern techs and develop Wroom project (car aid app). But I feel I’m bored with Wroom. It’s not that field I want to work at. I’m very interested in medicine and ecology, so last week I was thinking about new app idea. As always my wife provided me with an awesome idea: app for medications taking control, dosage info and so forth.

(Yeah, my wife is a doctor. Maybe I like medicine because of her influence. But, on the other hand, I always wanted to invent things that can help people to improve their lives.)

OK. Going to write points I want to implement in my app.

## App Features

- Information about medications, with pictures. Would be great to provide actual instructions. And… What about getting information about medication by taking a photo? Computer vision is a wonderful one! 🤓
- User’s medications list. Necessarily with alarms. I know situations when you need to take several different pills during week or more, and it is rather hard to control scheduling. In such situations people just use alarm clock on their smartphones. And now imaging you have an app that controls your medications taking schedule. Looks awesome and useful, as for me.
- Proceeding with a previous point, I want to see medications taking schedule chart in the app. Would be cool to have different chart variants to represent information understandable way for different people. I think it will be useful for complex scheduling.
- Sharing user actions with people who want to control medications taking. E.g., doctors or family members. You understand me, if you have old grandparents in your family.

Here we go! If you have more ideas or want to correct me, feel free to leave comment.

## Techs

As for Wroom application, I’m going to use [Ionic](https://ionicframework.com/) on [Capacitor](https://capacitorjs.com/), [React](https://reactjs.org/) and [TypeScript](https://www.typescriptlang.org/) on frontend. On backend going to use [Node.js](https://nodejs.org/uk/). Still not sure about database, thinking about [PostgreSQL](https://www.postgresql.org/) with [Sequelize ORM](https://sequelize.org/).

I faced a lot of problems using [Auth0](https://auth0.com/) with Capacitor, so decided to develop my own auth service; close to finish; that was good idea to understand oAuth deeper.

## Summary

That’s it! Hope to find time to start working on it. Fell free to connect me if you want to discuss this article.

Would be cool to find teammates for this pet project… So, just message me, if you want to take part in this development!
