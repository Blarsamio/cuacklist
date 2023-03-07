const mobileMenuButton = document.getElementById('btn');
const mobileMenu = document.getElementById('menu');

mobileMenuButton.addEventListener('click', () => {
  console.log('click');
  const expanded = mobileMenuButton.getAttribute('aria-expanded') === 'true' || false;
  mobileMenuButton.setAttribute('aria-expanded', !expanded);
  mobileMenu.classList.toggle('hidden');
});

mobileMenuButton();
