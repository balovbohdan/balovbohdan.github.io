# Organizing Modules in React Project — Low Coupling and High Cohesion

## Design robust applications

![Cover](/content/blog/posts/coupling-and-cohesion/cover.jpg)
<center>Photo by [XPS](https://unsplash.com/@xps) on [Unsplash](https://unsplash.com/photos/7ZWVnVSaafY)</center>

How do you organize modules in a React project you are working on? I hope you place elements related to each other together (module) and then set up connections between these groups of elements. Right?

The principle described above allows designing extensible applications. It sounds like the following:

> Organize system elements in a way to be decoupled and cohesive. I.e., prefer low coupling and high cohesion.

You may have already heard this rule. But have you ever wondered what does it really mean and what real benefit could it provide? I suggest you dive deeper into these questions and gain a justification for following this rule.

## Coupling

Coupling is something like connections between system elements. High coupling is when elements of a system have chaotic connections.

Technically, we can measure the value of coupling — this is just a number of connections between system elements (functions, objects, modules, etc.). The rule states that the system should have the lowest possible number of connections. In this case, we can be sure that there are only expected connections, and we are able to manage them effectively.

![Coupling](https://raw.githubusercontent.com/balovbohdan/balovbohdan.github.io/github-page/content/blog/posts/coupling-and-cohesion/coupling.png)
<center>Pic. 1. Coupling</center>

Actually, not sure that there is an easy way to calculate the number of connections. I even don’t think that this number could be really useful!

Let’s imagine that we’ve calculated a number of connections some way and it’s “100”. Is it much or not? How can we use this number to improve an existing system? Not sure what to answer here.

So, how to improve an existing system? The only adequate way is to follow the techniques we are going to discuss a bit later.

## Cohesion

Cohesion is when elements of a system are grouped together by some criteria. Low cohesion means that app elements don’t have clear boundaries. This may look like a mess.

There are a lot of things we can call a “group”:

- module
- class
- React component (both class and functional)
- namespace
- service
- and so on…

![Cohesion](https://raw.githubusercontent.com/balovbohdan/balovbohdan.github.io/github-page/content/blog/posts/coupling-and-cohesion/cohesion.png)
<center>Pic. 2. Cohesion</center>

But why is it useful? Because in a cohesive system there are much fewer connections between elements. And this leads to better management of these connections and we may be more sure that they are expected.

As you can see, “coupling” and “cohesion” terms always go together. In this case, supporting high cohesion is a better solution to decreasing the number of connections and making a system more manageable and extensible.

## Coupling & Cohesion

Let’s explore different cases. Below you can find a diagram that describes connections between “coupling” and “cohesion”. This may be useful for analyzing your application and creating an improvement plan.

![Coupling and Cohesion](https://raw.githubusercontent.com/balovbohdan/balovbohdan.github.io/github-page/content/blog/posts/coupling-and-cohesion/coupling-cohesion.png)
<center>Pic. 3. Coupling & Cohesion</center>

### 1 - Ideal: low coupling, high cohesion

This is a case we need to support. Such a system is manageable and extensible. In most cases devs like working with similar systems as it may be divided into logical parts; this leads to lower mental pressure during the dev process.

Below you can see how connections between elements may look like in this case.


![Ideal: low coupling, high cohesion](https://raw.githubusercontent.com/balovbohdan/balovbohdan.github.io/github-page/content/blog/posts/coupling-and-cohesion/connections-1.png)
<center>Pic. 4. Ideal: low coupling, high cohesion</center>

How to follow this rule? Not a complex one: organize related elements in groups (see above) and set up connections between groups.

This is how project structure may look in this case.

```
app
├── components
│   ├── dropdown
│   .   ├── container.js
│       ├── component.js
│       ├── utils.js
│       ├── use-options-search.js
│       └── index.js
├── utils
│   ├── find-tree-items
│   .   ├── find-tree-items.js
│       ├── find-tree-items.test.js
│       └── index.js
├── hooks
│   ├── use-previous
│   .   ├── use-previous.js
│       ├── use-previous.test.js
│       └── index.js
├── index.js
.
```

And now let’s see a contrived code example.

```js
// app/index.js

import usePrevious from 'hooks/use-previous';
import Dropdown from 'components/dropdown';

const App = () => {
  const [value, setValue] = useState('');
  const previousValue = usePrevious(provalue);

  const handleChange = useCallback((event) => {
    setValue(event.value);
  }, []);

  return (
    <>
      <span>Pevious value: {previousValue}</span>
      <Dropdown
        onChange={handleChange}
        options={[/*...*/]} />
    </>
  );
};

// ...
```

### 2 - God Module: high coupling, high cohesion

For me, this is the worst case, and every team should avoid it. Such a system is hardly manageable and cannot be extended in an adequate manner.

![God module: high coupling, high cohesion](https://raw.githubusercontent.com/balovbohdan/balovbohdan.github.io/github-page/content/blog/posts/coupling-and-cohesion/connections-2.png)
<center>Pic. 5. God module: high coupling, high cohesion</center>

In this situation, there is a mess of system elements. Let’s imagine how this may look in code structure.

```
app
├── components
│   ├── dropdown
│   .   ├── container.js
│       ├── component.js
│       ├── utils.js
│       ├── use-options-search.js
│       ├── use-user-options-data.js
│       ├── use-language-options-data.js
│       └── index.js
├── index.js
.
```

And contrived code example.

```js
// app/component/dropdown/container

import useOptionsSearch from './use-options-search';
import useUserOptionsData from './use-user-options-data';
import useLanguageOptionsData from './use-language-options-data';
import * as utils from './utils';
import Dropdown from './component';

const DropdownContainer = (props) => {
  const optionsSearch = useOptionsSearch(/*...*/);
  const userOptionsData = useUserOptionsData(/*...*/);
  const langageOptionsData = useLanguageOptionsData(/*...*/);

  const optionsData = useMemo(() => {
    switch (props.dataType) {
      case 'user':
        return userOptionsData;
      case 'language':
        return languageOptionsData;
      default:
        return [];
    }
  }, [props.dataType]);

  return (
    <Dropdown {/*...*/} />
  );
};

DropdownContainer.propTypes = {
  onChange: PropTypes.func.isRequired,
  dataType: PropTypes.oneOf(['user', 'language']).isRequired,
};

export default DropdownContainer;
```

The problem here is that there is data logic embedded into a shared component. This component should be reusable, and new data types should not affect it. Please, avoid such a design and keep all the specific logic outside the reusable component.

### 3 - Wrong Boundaries: high coupling, low cohesion

Let’s explore the diagram and examples w/o any additional words.

![Wrong boundaries: high coupling, low cohesion](https://raw.githubusercontent.com/balovbohdan/balovbohdan.github.io/github-page/content/blog/posts/coupling-and-cohesion/connections-3.png)
<center>Pic. 6. Wrong boundaries: high coupling, low cohesion</center>

Contrived project structure.

```
app
├── components
│   ├── dropdown
│   .   ├── container.js
│       ├── component.js
│       └── index.js
├── utils
│   ├── find-tree-items
│   │   ├── find-tree-items.js
│   │   ├── find-tree-items.test.js
│   │   └── index.js
│   ├── dropdown-utils
│   .   ├── ...
│       .
├── hooks
│   ├── use-previous
│   │   ├── use-previous.js
│   │   ├── use-previous.test.js
│   │   └── index.js
│   ├── use-dropdown-options-search
│   .   ├── use-dropdown-options-search.js
│       ├── use-dropdown-options-search.test.js
│       └── index.js
├── index.js
.
```

And contrived code example.

```js
// app/component/dropdown/container

import useDropdownOptionsSearch from 'hooks/use-dropdown-options-search';
import * as dropdownUtils from 'utils/dropdown-utils';
import Dropdown from './component';

const DropdownContainer = (props) => {
  const optionsSearch = useDropdownOptionsSearch(/*...*/);

  return (
    <Dropdown {/*...*/} />
  );
};

DropdownContainer.propTypes = {
  onChange: PropTypes.func.isRequired,
  options: PropTypes.arrayOf(PropTypes.object).isRequired,
};

export default DropdownContainer;
```

Hope it is clear to you that boundaries are wrong in this example. Such an app should be redesigned to be like in the first example.

### 4 - Destructive Decoupling: low coupling, low cohesion

Let’s explore the diagram and examples w/o verbose explanations.

![Destructive Decoupling: low coupling, low cohesion](https://raw.githubusercontent.com/balovbohdan/balovbohdan.github.io/github-page/content/blog/posts/coupling-and-cohesion/connections-4.png)
<center>Pic. 7. Destructive Decoupling: low coupling, low cohesion</center>

Contrived code structure.

```
app
├── dropdown.js
├── find-tree-items.js
├── find-tree-items.test.js
├── dropdown-utils.js
├── use-previous.js
├── use-previous.test.js
├── use-dropdown-options-search.js
├── use-dropdown-options-search.test.js
├── index.js
.
```

And contrived code example.

```js
// app/index.js

import usePrevious from './use-previous';
import Dropdown from './dropdown';

const App = () => {
  const [value, setValue] = useState('');
  const previousValue = usePrevious(provalue);

  const handleChange = useCallback((event) => {
    setValue(event.value);
  }, []);

  return (
    <>
      <span>Pevious value: {previousValue}</span>
      <Dropdown
        onChange={handleChange}
        options={[/*...*/]} />
    </>
  );
};

// ...
```

The problem here is that there are a lot of elements thrown in the same pile. And it is rather hard to understand the usage scope of every module (file).

## ...

That’s it! Hope you enjoyed this content and this will help you design robust applications.

You can find this article in [my Medium blog](https://medium.com/@balovbohdan/coupling-cohesion-552b022492b2).
