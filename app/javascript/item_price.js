function price (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value
    const addTaxDom = document.getElementById("add-tax-price");
    const addTaxPrice = Math.floor(inputValue * 0.1);
    addTaxDom.innerHTML = addTaxPrice;

    const profitDom = document.getElementById("profit");
    const profitPrice = inputValue - addTaxPrice
    profitDom.innerHTML = profitPrice;
  })
}

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price)