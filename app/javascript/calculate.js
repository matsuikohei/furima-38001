function calculation(){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const itemVal = Math.floor(itemPrice.value);
    const addTaxPrice = document.getElementById("add-tax-price");
    const tax = 0.1;
    const taxPriceNum = Math.floor(itemVal * tax) ;
    const taxPriceStr = taxPriceNum.toLocaleString();
    addTaxPrice.innerHTML = `${ taxPriceStr }`;

    const profit = document.getElementById("profit");
    const profitValNum = itemVal - taxPriceNum;
    const profitValStr = profitValNum.toLocaleString();
    profit.innerHTML = `${ profitValStr }`;

  })
}

window.addEventListener('load', calculation)