# What You Need to Know about the Inversion of Control

## Inversion of Control principle applied to React projects

![STAR Technique](/content/blog/posts/what-you-need-to-know-about-the-ioc/cover.jpg)
<center>Photo by [Martin Sanchez](https://unsplash.com/@martinsanchez) on [Unsplash](https://unsplash.com/photos/SL1co_Etck8)</center>

## TL;DR

When I opened the explanation of the “Inversion of Control” principle on [Wikipedia](https://en.wikipedia.org/wiki/Inversion_of_control), I was stuck — it is described in so complex and not human-readable way… In this article, you will find a problem definition and its solution with the “Inversion of Control” principle and hope this will be much easier to understand than content from Wikipedia.

In short, the “Inversion of Control” (IoC) principle is a way of building an API for some module that allows flexible customizations of this module w/o tons of input parameters like:

- flags (e.g., “visibleIcon”, “disabledSubSecionSubmitButton”, and similar)
- types (e.g., `iconType="primary"`, `subSectionSubmitButonType="secondary"`)

This is how looks regular usage of React component that doesn’t implement IoC:

```js
<Section
  visibleIcon={!props.loading}
  disabledSubSecionSubmitButton={props.loading || !props.valid}
  iconType="primary"
  subSectionSubmitButonType="secondary" />
```

And this is how we can use this “Section” component that follows the IoC principle and implements appropriate API:

```js
<Section>
  {!props.loading && <Icon type="primary" />}
  <Section.Sub>
    <Button
      type="secondary"
      disabled={props.loading || !props.valid}>
      Submit
    </Button>
  </Secion.Sub>
</Section>
```

## ...

Let’s imagine that you are building a big application with React. One day business asks you to develop a common solution for the dropdown UI element — the “Dropdown” React component. I assume it may look something like the following (pic. 1).

![Dropdown React Component](/content/blog/posts/what-you-need-to-know-about-the-ioc/dropdown-v1.jpg)
<center>Pic.1 Dropdown v1 [source](https://www.carbondesignsystem.com/components/dropdown/usage/)</center>

You may think now it looks rather good and definitely should be proud of your work!

Time goes and this “Dropdown” component has already been used in hundreds of places by a lot of developers. The component works as expected and looks consistently all over the app — it is a benefit of using shared components within a system. It enforces a team using the same tech approaches and results in a consistent design.

Here is how the code for this component may look. I’m not going to dive deep into implementation details — only the main parts related to the topic are specified.

```js
// dropdown/component.js

const Dropdown = (props) => {
  const [placeholder, setPlaceholder] = useState(props.placeholder);
  const [isOpen, setIsOpen] = useState(false);

  const handleToggle = useCallback(() => {
    setIsOpen(!isOpen);
  }, []);

  const handleOptionClick = useCallback(() => {
    // ...
  }, [/*...*/]);

  return (
    <div className="dropdown">
      <div className="placeholder" onClick={handleToggle}>
        {placeholder}
      </div>
      <div className="options">
        {
          props.isOpen && (
            props.options.map((option) => (
              <div key={option.id} className="option">
                {option.title}
              </div>
            ))
          )
        }
      </div>
    </div>
  );
};

Dropdown.propTypes = {
  placeholder: PropTypes.string.isRequired,
  options: PropTypes.object.isRequired,
};

export default Dropdown;
```

Once again. It’s a good solution. But, unfortunately, not extensible.

This is the usage example.

```js
<Dropdown
  placeholder="Dropdown menu options"
  options={[
    { id: 'option-1', title: 'Option 1' },
    { id: 'option-2', title: 'Option 2' },
  ]} />
```

## Extensibility problem

The app is growing. And there are new requirements to design: dropdown should have different forms of view in different places. This means you need to allow customizations to be applied to the “Dropdown” React component.

E.g., it’s required to add two UI elements to dropdown options:

- icon leading the option title
- text sign following the option title

See pic. 1. Please, don’t blame me for this not-beautiful picture. I aim to develop useful content oftener, so for now, I prefer neglecting such details. Hope you understand.

![Dropdown React Component](/content/blog/posts/what-you-need-to-know-about-the-ioc/dropdown-v2.jpg)
<center>Pic.2 Dropdown v2 [source](https://www.carbondesignsystem.com/components/dropdown/usage/)</center>

We can follow a naive approach to develop the initial solution. This solution assumes adding props for controlling these new UI elements — a rather popular solution. But not very good, as we will see later.

Let’s try.

```js
// dropdown/component.js

const Dropdown = (props) => {
  const [placeholder, setPlaceholder] = useState(props.placeholder);
  const [isOpen, setIsOpen] = useState(false);

  const handleToggle = useCallback(() => {
    setIsOpen(!isOpen);
  }, []);

  const handleOptionClick = useCallback(() => {
    // ...
  }, [/*...*/]);

  return (
    <div className="dropdown">
      <div className="placeholder" onClick={handleToggle}>
        {placeholder}
      </div>
      <div className="options">
        {
          props.isOpen && (
            props.options.map((option) => (
              <div key={option.id} className="option">
                {
                  props.visibleOptionIcon && (
                    <img className="icon" src={option.icon} />
                  )
                }
                <span className="title">{option.title}</span>
                {
                  props.visibleOptionSign && (
                    <span className="sign">{option.sign}</span>
                  )
                }
              </div>
            ))
          )
        }
      </div>
    </div>
  );
};

Dropdown.propTypes = {
  placeholder: PropTypes.string.isRequired,
  options: PropTypes.object.isRequired,

  // new props controlling new UI elements
  visibleOptionIcon: PropTypes.bool.isRequired,
  visibleOptionSign: PropTypes.bool.isRequired,
};

export default Dropdown;
```

This is the usage example.

```js
<Dropdown
  placeholder="Dropdown menu options"
  options={[
    {
      id: 'option-1',
      title: 'Option 1',
      sign: 'Sign 1',
      icon: './icon.svg',
    },
    {
      id: 'option-2',
      title: 'Option 2',
      sign: 'Sign 2',
      icon: './icon.svg',
    },
  ]}
  visibleOptionIcon
  visibleOptionSign />
```

Looks not so bad. The developer can control the view using “props”. But as I have already mentioned, it is not an ideal solution. Just imagine the future growth of this component — this will be hell when a component will have tons of props controlling the UI elements. It also will require keeping all the related logic in sync. Just believe me that support of such components is not a better thing in the front-end developer’s career. 😀

Let’s rework this component!

## Inversion of control

There are several patterns we can follow implementing inversion of control for React component:

- [render props](https://reactjs.org/docs/render-props.html#gatsby-focus-wrapper)
- [React children](https://en.reactjs.org/docs/composition-vs-inheritance.html)

Both approaches are good. Every one of them may be useful in different cases. I use both, but in most cases, I prefer the second option. And I’m going to lean to this approach and describe it in detail. I believe that the “render props” approach will be easy-to-understand for you if you will understand the “children” approach. Also, there are tons of cool articles about “render props” and I don’t want to repeat them.

P.S. These patterns are tightly connected with a [“Compound Components”](https://medium.com/unibuddy-technology-blog/compound-components-in-react-b04772f9eb58) pattern within the current article. It is a useful thing for developing [cohesive](https://medium.com/clarityhub/low-coupling-high-cohesion-3610e35ac4a6) components. See the provided article for more details.

The idea of the “children” approach assumes using “children” property (Capitan Obvious) and common components re-exported from the customizable component’s root.

This is the root component — “Dropdown”.

```js
// dropdown/component.js

const Dropdown = (props) => {
  const [placeholder, setPlaceholder] = useState(props.placeholder);
  const [isOpen, setIsOpen] = useState(false);

  const handleToggle = useCallback(() => {
    setIsOpen(!isOpen);
  }, []);

  const handleOptionClick = useCallback(() => {
    // ...
  }, [/*...*/]);

  return (
    <div className="dropdown">
      <div className="placeholder" onClick={handleToggle}>
        {placeholder}
      </div>
      <div className="options">
        {
          props.children({ onOptionClick: handleOptionClick })
        }
      </div>
    </div>
  );
};

Dropdown.propTypes = {
  placeholder: PropTypes.string.isRequired,

  // key part of the pattern
  // it may be either "func" or "node" depending on the solution
  children: PropTypes.func.isRequired,
};

export default Dropdown;
```

Then we need to develop components representing custom UI elements — “Option”, “Option.Title”, “Option.Icon” and “Option.Sign”.

```js
// dropdown/option/component.js

const Option = (props) => (
  <div className="option">
    {props.children}
  </div>
);

Option.propTypes = {
  children: PropTypes.node.isRequired,
};

export defult Option;
```

```js
// dropdown/option/title/component.js

const Title = (props) => (
  <span className="title">
    {props.children}
  </span>
);

Title.propTypes = {
  children: PropTypes.node.isRequired,
};

export default Title;
```

```js
// dropdown/option/icon/component.js

const Icon = (props) => (
  <img
    className="icon"
    src={props.src}
    alt={props.alt}
    title={props.title} />
);

Icon.propTypes = {
  src: PropTypes.node.isRequired,
  alt: PropTypes.string.isRequired,
  title: PropTypes.string.title,
};

export default Icon;
```

```js
// dropdown/option/sign/component.js

const Sign = (props) => (
  <span className="sign">
    {props.children}
  </span>
);

Sign.propTypes = {
  children: PropTypes.node.isRequired,
};

export default Sign;
```

Now we need to assemble all these pieces into a single entity.

```js
// dropdown/index.js

import Dropdown from './component';
import Option from './option';

Dropdown.Option = Option;

export default Dropdown;
```

```js
// dropdown/option/index.js

import Option from './component';
import Title from './title';
import Icon from './icon';
import Sign from './sign';

Option.Title = Title;
Option.Icon = Icon;
Option.Sign = Sign;

export default Option;
```

And now let’s try looking at the usage example. It is very different from the first example.

```js
import Dropdown from '<some-path>/dropdown';

const App = () => {
  const options = useMemo(() => ([
    {
      id: 'option-1',
      title: 'Option 1',
      sign: 'Sign 1',
      icon: './icon.svg',
    },
    {
      id: 'option-2',
      title: 'Option 2',
      sign: 'Sign 2',
      icon: './icon.svg',
    },
  ]), []);

  return (
    <Dropdown placeholder="Dropdown menu options">
      {
        options.map((option) => (
          <Dropdown.Option key={option.id}>
            <Dropdown.Option.Icon>
              {option.icon}
            </Dropdown.Option.Icon>
            <Dropdown.Option.Title>
              {option.title}
            </Dropdown.Option.Title>
            <Dropdown.Option.Sign>
              {option.sign}
            </Dropdown.Option.Sign>
          </Dropdown.Option>
        ))
      }
    </Dropdown>
  );
};

export default App;
```

Looks good! Does it?

You may think that there are a lot of small pieces that may be merged into a single entity. But that’s not right: we need these small parts to provide all conditions for extensibility and usage convenience.

It is really extensible now. Let me provide an example of adding a new UI element option — “Button”.

```js
// dropdown/option/button/component.js

const Button = (props) => (
  <button className="button" onClick={props.onClick}>
    {props.children}
  </button>
);

Button.propTypes = {
  children: PropTypes.node.isRequired,
  onClick: PropTypes.func.isRequired,
};

export default Button;
```

Now we need to connect this new “Button” to the “Option”.

```js
// dropdown/option/index.js

import Option from './component';
// ...
import Button from './button';

// ...
Option.Button = Button;

export default Option;
```

And, finally, the usage example.

```js
import Dropdown from '<some-path>/dropdown';

const App = () => {
  const options = useMemo(() => ([
    {
      id: 'option-1',
      title: 'Option 1',
      sign: 'Sign 1',
      icon: './icon.svg',
    },
    {
      id: 'option-2',
      title: 'Option 2',
      sign: 'Sign 2',
      icon: './icon.svg',
    },
  ]), []);

  const handleOptionButtonClick = useCallback(() => {
    // ...
  }, [/*...*/]);

  return (
    <Dropdown placeholder="Dropdown menu options">
      {
        options.map((option) => (
          <Dropdown.Option key={option.id}>
            <Dropdown.Option.Title>
              {option.title}
            </Dropdown.Option.Title>
            <Dropdown.Option.Button
              onClick={handleOptionButtonClick}>
              Show Details
            </Dropdown.Option.Button>
          </Dropdown.Option>
        ))
      }
    </Dropdown>
  );
};

export default App;
```

## ...

I can proceed with this topic. But not sure this makes sense. I’d suggest you stop reading at this point, open your code editor and try the suggested solution. This is the best thing you can do to learn best practices.

You can also google and find a lot of useful resources related to this topic. I like this [“Inversion of Control”](https://kentcdodds.com/blog/inversion-of-control) article by [Kent C. Dodds](https://medium.com/@kentcdodds).

Feel free to connect with me in case of any questions.

Good luck!

## ...

You can find this article in [my Medium blog](https://javascript.plainenglish.io/what-you-need-to-know-about-the-inversion-of-control-for-react-278c0f4dcd18).
