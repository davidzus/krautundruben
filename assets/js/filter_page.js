const searchInput = document.getElementById("search");
const searchBtn = document.getElementById("search_btn");
const filterTitle = document.querySelectorAll(".filter-title");
const hero = document.querySelector(".hero");
const productResultCount = document.querySelector(".product_result_count");
const productResults = document.querySelectorAll(".product_item");

window.onpageshow = () => {
    window.scrollTo(0, (hero.scrollHeight - 70));
}

// Filter Boxes Animation
filterTitle.forEach((item) => {
    item.addEventListener("click", () => {
        item.classList.toggle("active");
        item.children[0].classList.toggle("active");
        if (item.classList.contains("active")) {
            item.nextElementSibling.classList.add("active");

        } else {
            item.nextElementSibling.classList.remove("active");
        }
    })
});

// Product Count
productResultCount.innerHTML = `Showing ${productResults.length} results`;

// Filter Params History Function

loadCheckboxesStates();
function loadCheckboxesStates(){
    const form = document.querySelector(".product_filter");
    const search = document.getElementById("search");
    const params = new URLSearchParams(window.location.search);
    params.forEach((value,key) => {
        if (key == 'search'){
            search.value = value;
        }
        const checkboxes = form.querySelectorAll(`input[type='checkbox'][value="${value}"]`);
        for(let checkbox of checkboxes){
            checkbox.checked = true;
        }
});
}