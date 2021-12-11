import 'codemirror';

class CodemirrorElm extends HTMLElement {
  static get observedAttributes() {
    return [];
  }

  constructor() {
    super();
  }

  connectedCallback() {
    this.setHtml();
  }

  attributeChangedCallback() {
    this.setHtml();
  }

  setHtml() {
    this.innerHTML = `
      <div>FOO HTML INNER</div>
    `;
  }
}

customElements.define('code-mirror', CodemirrorElm);
