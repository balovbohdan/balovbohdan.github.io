import Codemirror from 'codemirror';
import { nanoid } from 'nanoid';
import 'codemirror/mode/javascript/javascript';
import 'codemirror/lib/codemirror.css';
import 'codemirror/theme/material.css';

import * as constants from './constants';

class CodemirrorElm extends HTMLElement {
  #id = `code-${nanoid()}`;

  static get observedAttributes() {
    return ['value', 'theme', 'mode', 'lineNumbers', 'lineWrapping', 'readOnly'];
  }

  constructor() {
    super();
  }

  connectedCallback() {
    this.render();
  }

  attributeChangedCallback() {
    this.render();
  }

  render() {
    this.innerHTML = `<div id="${this.#id}"></div>`;

    const theme = this.getAttribute('theme');
    const mode = this.getAttribute('mode');
    const readOnly = this.getAttribute('readOnly');
    const lineNumbers = this.getAttribute('lineNumbers') === 'True';
    const lineWrapping = this.getAttribute('lineWrapping') === 'True';
    const wrapper = document.getElementById(this.#id);
    const codemirror = new Codemirror(wrapper, {
      theme,
      mode,
      lineNumbers,
      lineWrapping,
      readOnly,
    });

    codemirror.setValue(this.getAttribute('value'));
  }
}

customElements.define('codemirror-elm', CodemirrorElm);
