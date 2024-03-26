
document.addEventListener('DOMContentLoaded', function () {
    // JavaScript to toggle navbar visibility
    const menuButton = document.getElementById('menuButton');
    const navbar = document.getElementById('navbar');

    menuButton.addEventListener('click', () => {
        if (navbar.style.left === '0px') {
            navbar.style.left = '-200px';
        } else {
            navbar.style.left = '0px';
        }
        menuButton.querySelector('#menuIcon').classList.toggle('open');
    });

    // Get the "Schedule" link
    const schedule = document.getElementById('schedule');

    // Add click event listener
    schedule.addEventListener('click', function (event) {
        // Prevent the default behavior of the link (preventing it from navigating to '#')
        event.preventDefault();

        // Get the location of the tables
        const tablesLocation = document.getElementById('schedule').offsetTop;

        // Calculate the middle position of the table
        const middlePosition = tablesLocation + (tableHeight / 2);

        // Scroll to the middle position of the table with smooth behavior
        window.scrollTo({
            top: middlePosition,
            behavior: 'smooth'
        });
    });
});
