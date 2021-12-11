import { Elm } from './Main.elm';

// import '../codemirror-elm';

const parseJson = (defaultResult, json) => {
  try {
    return JSON.parse(json);
  } catch (error) {
    console.error(error);

    return defaultResult;
  }
};

const getColorSchema = () => {
  const colorSchema = window.localStorage.getItem('colorSchema');
  const defaultColorSchema = 'light';

  return colorSchema ? parseJson(defaultColorSchema, colorSchema) : defaultColorSchema;
};

const app = Elm.Main.init({
  node: document.getElementById('app'),
  flags: { colorSchema: getColorSchema() },
});

app.ports.localStorageOutcomePort.subscribe((event) => {
  const { action, key, value } = parseJson({}, event);

  switch (action) {
    case 'set':
      window.localStorage.setItem(key, JSON.stringify(value));
      break;
    case 'delete':
      delete window.localStorage[key];
      break;
    default:
      console.warn('Cannot find localStorage action: ' + action);
  }
});
