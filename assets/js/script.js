// ********* Shopping Cart Toolbar *********

const shoppingCartToolbar = document.querySelector('.shopping_cart-toolbar');
const shoppingCartBtn = document.querySelector('.menu_item.shopping_cart');
const shoppingCartIcon = document.querySelector('.menu_item.shopping_cart');
const toolbarCloseBtn = document.querySelector('.toolbar_close-btn');

toolbarCloseBtn.addEventListener('click', (e) => {
  shoppingCartToolbar.classList.remove('active');
  shoppingCartIcon.classList.remove('shopping_cart-ico-active'); 
});

shoppingCartBtn.addEventListener('click', (e) => {
  e.preventDefault();
  shoppingCartToolbar.classList.toggle('active');
  shoppingCartIcon.classList.toggle('shopping_cart-ico-active'); 
});

