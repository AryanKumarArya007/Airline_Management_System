// scripts.js

// Utility function to show an alert message
function showAlert(message) {
    alert(message);
}

// Validate login form
function validateLoginForm() {
    const username = document.getElementById("username").value;
    const password = document.getElementById("password").value;
    if (username === "" || password === "") {
        showAlert("Please fill in all required fields.");
        return false;
    }
    return true;
}

// Validate registration form
function validateRegisterForm() {
    const username = document.getElementById("username").value;
    const password = document.getElementById("password").value;
    if (username === "" || password === "") {
        showAlert("Please fill in all required fields.");
        return false;
    }
    return true;
}

// Add event listeners for form validation
document.addEventListener("DOMContentLoaded", () => {
    const loginForm = document.querySelector("form[action*='UserServlet'][method='post'][action*='login']");
    const registerForm = document.querySelector("form[action*='UserServlet'][method='post'][action*='register']");
    
    if (loginForm) {
        loginForm.addEventListener("submit", (event) => {
            if (!validateLoginForm()) {
                event.preventDefault();
            }
        });
    }
    
    if (registerForm) {
        registerForm.addEventListener("submit", (event) => {
            if (!validateRegisterForm()) {
                event.preventDefault();
            }
        });
    }
});
