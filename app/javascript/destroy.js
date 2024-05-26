document.addEventListener('turbo:load', () => {
  const classes = ['.delete-button', '.delete-button2'];
  const selector = classes.join(',');

  document.querySelectorAll(selector).forEach(link => {
    link.addEventListener('click', (event) => {
      if (!confirm(link.getAttribute('data-confirm'))) {
        event.preventDefault();
      }
    });
  });
});