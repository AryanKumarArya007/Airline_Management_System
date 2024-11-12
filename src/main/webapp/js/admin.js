// admin.js

// Confirm before deleting a flight
function confirmDeleteFlight(flightId) {
    if (confirm("Are you sure you want to delete this flight?")) {
        window.location.href = `FlightServlet?action=delete&flightId=${flightId}`;
    }
}

// Confirm before deleting a user
function confirmDeleteUser(userId) {
    if (confirm("Are you sure you want to delete this user?")) {
        window.location.href = `UserServlet?action=delete&userId=${userId}`;
    }
}

// Additional functionality for admin forms or actions
document.addEventListener("DOMContentLoaded", () => {
    // Add event listeners for delete buttons, if they exist
    const deleteFlightButtons = document.querySelectorAll(".delete-flight");
    deleteFlightButtons.forEach(button => {
        button.addEventListener("click", (event) => {
            event.preventDefault();
            const flightId = button.getAttribute("data-flight-id");
            confirmDeleteFlight(flightId);
        });
    });

    const deleteUserButtons = document.querySelectorAll(".delete-user");
    deleteUserButtons.forEach(button => {
        button.addEventListener("click", (event) => {
            event.preventDefault();
            const userId = button.getAttribute("data-user-id");
            confirmDeleteUser(userId);
        });
    });
});
