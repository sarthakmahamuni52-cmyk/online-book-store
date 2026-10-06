// Login

const loginForm = document.getElementById("loginForm");

if(loginForm){

loginForm.addEventListener("submit",function(e){

e.preventDefault();

let username=document.getElementById("username").value;

let password=document.getElementById("password").value;

let savedUser = localStorage.getItem("username");
let savedPass = localStorage.getItem("password");

if (
    (username === "admin" && password === "12345") ||
    (username === savedUser && password === savedPass)
) {

    window.location.href = "home.html";

} else {

    document.getElementById("message").innerHTML = "Invalid Username or Password";

}
});

}

/// Add To Cart using LocalStorage

function addToCart(name, price) {

    let cart = JSON.parse(localStorage.getItem("cart")) || [];

    cart.push({
        name: name,
        price: price
    });

    localStorage.setItem("cart", JSON.stringify(cart));

    alert(name + " added to cart successfully!");

}

function removeBook(index){

    let cart = JSON.parse(localStorage.getItem("cart")) || [];

    cart.splice(index,1);

    localStorage.setItem("cart", JSON.stringify(cart));

    location.reload();


}
function checkout() {

    let cart = JSON.parse(localStorage.getItem("cart")) || [];

    if (cart.length === 0) {
        alert("Your cart is empty!");
        return;
    }

    window.location.href = "checkout.html";
}
function placeOrder() {

    alert("🎉 Order Placed Successfully!");

    localStorage.removeItem("cart");

    window.location.href = "success.html";

}
function register(){

    let user = document.getElementById("newUser").value;
    let pass = document.getElementById("newPass").value;

    localStorage.setItem("username", user);
    localStorage.setItem("password", pass);

    alert("Registration Successful!");

    window.location.href="login.html";

}
document.addEventListener("DOMContentLoaded", function () {

    let cart = JSON.parse(localStorage.getItem("cart")) || [];

    let count = document.getElementById("cart-count");

    if (count) {
        count.innerHTML = cart.length;
    }

});
// Search Books
document.addEventListener("DOMContentLoaded", function () {

    let search = document.getElementById("search");

    if (search) {

        search.addEventListener("keyup", function () {

            let value = search.value.toLowerCase();

            let books = document.querySelectorAll(".book");

            books.forEach(function (book) {

                let title = book.querySelector("h3").innerText.toLowerCase();

                if (title.includes(value)) {
                    book.style.display = "block";
                } else {
                    book.style.display = "none";
                }

            });

        });

    }

});