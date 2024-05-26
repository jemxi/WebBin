<style>
    /* Modal styles */
    .modal {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
        animation: fadeIn 0.3s; /* Fade in animation */
    }

    .modal-content {
        background-color: #fefefe;
        margin: 15% auto; /* 15% from the top and centered */
        padding: 20px;
        border: 1px solid #888;
        width: 80%; /* Could be more or less, depending on screen size */
        max-width: 400px;
        border-radius: 8px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        text-align: center;
        animation: slideIn 0.3s; /* Slide in animation */
    }

    .modal-content h2 {
        margin: 0 0 20px;
    }

    .modal-buttons {
        display: flex;
        justify-content: space-between;
    }

    .modal-button {
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s, transform 0.3s; /* Hover effect */
    }

    .cancel-button {
        background-color: #e0e0e0;
        color: #333;
    }

    .cancel-button:hover {
        background-color: #d5d5d5;
        transform: scale(1.05);
    }

    .logout-button {
        background-color: #6a5acd;
        color: white;
    }

    .logout-button:hover {
        background-color: #5949c1;
        transform: scale(1.05);
    }

    @keyframes fadeIn {
        from {opacity: 0;}
        to {opacity: 1;}
    }

    @keyframes slideIn {
        from {transform: translateY(-50px); opacity: 0;}
        to {transform: translateY(0); opacity: 1;}
    }
</style>
