import React from 'react';
import { createRoot } from 'react-dom/client';

export const Hook = {
  root: null,

  mounted() {
    if (!this.root) {
      this.root = createRoot(document.querySelector('#random-numbers'));
    }

    this.handleEvent('randomnumbers.update', ({ numbers }) => {
      const newNumbers = JSON.parse(numbers);
      this.renderComponent(newNumbers);
    });

    this.renderComponent([]);
  },

  destroyed() {
    if (!root) {
      console.error('RandomNumbers component is not mounted.');
      return;
    }

    this.root.unmount();
  },

  requestNumbers() {
    this.pushEventTo(this.el, 'randomnumbers.request_new', null, (({ numbers }) => {
      this.renderComponent(numbers);
    }));
  },

  renderComponent(numbers) {
    this.root.render(
      <Component
        numbers={numbers}
        requestNumbers={this.requestNumbers.bind(this)} />
    );
  }
}

function Component({ numbers, requestNumbers }) {
  if (!numbers || !numbers.length) {
    return (
      <>
        <h1>Request your first set of numbers</h1>
        <button onClick={requestNumbers}>Get numbers</button>
      </>
    );
  }

  return (
    <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'flex-start' }}>
      <h2>This week's winning lottery numbers are:</h2>

      {numbers.join(',')}

      <button onClick={requestNumbers} style={{ marginTop: '25px' }}>More please</button>
    </div>
  )
}
