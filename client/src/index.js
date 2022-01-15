import 'codemirror-elm';
import { Base64 } from 'js-base64';

import { Elm } from './elm/Main.elm';

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

const decodePostMeta = (data) => {
  const postMetaTable = Base64.decode(data.content);
  const postMetaTableLines = postMetaTable.split('\n').slice(2);
  const postMeta = postMetaTableLines.reduce((result, line) => {
    if (line) {
      const [key, value] = line.split('|').map((item) => item.trim()).filter(Boolean);

      return { ...result, [key.toLocaleLowerCase()]: value };
    } else {
      return result;
    }
  }, {});

  return postMeta;
};

const setMeta = (meta) => {
  const head = document.querySelector('head');

  head.querySelector('meta[name="description"]').setAttribute('content', meta.description);
  head.querySelector('meta[name="keywords"]').setAttribute('content', meta.keywords);

  head.querySelector('meta[property="og:title"]').setAttribute('content', meta.title);
  head.querySelector('meta[property="og:description"]').setAttribute('content', meta.description);
  head.querySelector('meta[property="og:image"]').setAttribute('content', meta.image);
  head.querySelector('meta[property="og:url"]').setAttribute('content', window.location.href);

  head.querySelector('meta[property="twitter:title"]').setAttribute('content', meta.title);
  head.querySelector('meta[property="twitter:description"]').setAttribute('content', meta.description);
  head.querySelector('meta[name="twitter:image:src"]').setAttribute('content', meta.image);
};

const app = Elm.Main.init({
  node: document.getElementById('app'),
  flags: { colorSchema: getColorSchema() },
});

const handleLocalStorageOutcomePort = (event) => {
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
};

const handleMetaChangePort = (event) => {
  const isPostPage = /\/posts\/\w+/.test(window.location.href);

  if (isPostPage) {
    const postMeta = decodePostMeta(JSON.parse(event[1]));

    setMeta({
      description: `${postMeta.description} | Mr. Balov`,
      keywords: postMeta.keywords,
      image: postMeta.cover,
    });
  } else {
    setMeta({
      description: 'Software Development Blog by Mr. Balov',
      keywords: 'javascript, frontend, software development, react',
      image: 'https://balovbohdan.github.io/assets/author-2.jpg',
    });
  }
};

const handleScrollToPort = (event) => {
  window.scrollTo(0, event);
};

app.ports.localStorageOutcomePort.subscribe(handleLocalStorageOutcomePort);
app.ports.metaChangePort.subscribe(handleMetaChangePort);
app.ports.scrollToPort.subscribe(handleScrollToPort);
