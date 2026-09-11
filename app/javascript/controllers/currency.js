function formatNumber(num) {
  return Number(num).toLocaleString("en-US");
}

let currency = window.APP_CURRENCY || "usd"

window.setCurrency = function(type){
  currency = type
   fetch(`/set_currency/${type}`, {
    method: "POST",
    headers: {
      "X-CSRF-Token": document.querySelector("[name='csrf-token']").content
    }
  }).then(() => {
    updatePrices()
  })
}

window.updatePrices = function(){

  document.querySelectorAll(".product").forEach(product => {

    const usd = product.dataset.usd
    const bs = product.dataset.bs
    const price = product.querySelector(".price")

    if(currency === "usd"){
      price.innerText = "$" + formatNumber(usd)
    }else{
      price.innerText = "Bs " + formatNumber(bs)
    }

  })

}
document.addEventListener("DOMContentLoaded", () => {
  updatePrices()
})


