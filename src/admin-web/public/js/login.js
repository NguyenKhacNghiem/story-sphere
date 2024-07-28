let checkbox = document.getElementById("show-password");
let username = document.getElementById("username");
let password = document.getElementById("password");

checkbox.addEventListener("click", () => {
    if(checkbox.checked === true) 
        password.setAttribute("type", "text");    
    else 
        password.setAttribute("type", "password");    
})

function login() {
    fetch("http://localhost:8080/login", {
        method: "post",
        body: new URLSearchParams({
            username: username.value,
            password: password.value
        })
    })
    .then(response => response.json())
    .then(json => {
        if(json.code === 100) {
            toastr.success(json.message, "Thông báo");
            setTimeout(() => document.location.href = "/statistic", 1000);
        }
        else
            toastr.error("Thông tin đăng nhập không chính xác", "Thông báo")
    })
}