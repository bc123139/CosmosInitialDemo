// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your Javascript code.
function addToCart(id, name, image, price) {
    var items = getCartItems();

    if (!items) {
        items = [];
    }

    items.push({
        "id": id,
        "name": name,
        "image": image,
        "price": price,
        "quantity": 1
    });
    localStorage.setItem("cartItems", JSON.stringify(items));
}

function getCartItems() {
    var items = localStorage.getItem("cartItems");
    return JSON.parse(items);

}

function clearCart() {
    localStorage.removeItem("cartItems");
}