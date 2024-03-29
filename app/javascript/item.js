function item (){
  const itemPrice  = document.getElementById("item-price");
  itemPrice.addEventListener("input", () => {
    const priceInput = itemPrice.value
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(priceInput * 10 /100)
    
    const addProfit = document.getElementById("profit");
    addProfit.innerHTML = (priceInput - addTaxDom.innerHTML).toLocaleString()
  });
};

window.addEventListener('turbo:load', item);
window.addEventListener("turbo:render", item);
