// Function to load and insert the header
async function loadHeader() {
    try {
        // First ensure Bootstrap Icons are loaded
        if (!document.querySelector('link[href*="bootstrap-icons"]')) {
            const iconLink = document.createElement('link');
            iconLink.rel = 'stylesheet';
            iconLink.href = 'https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css';
            document.head.appendChild(iconLink);
        }

        // Load header content
        const response = await fetch('header.html');
        const headerContent = await response.text();
        
        // Insert header at the beginning of the body
        document.body.insertAdjacentHTML('afterbegin', headerContent);

        // Add padding to body to account for fixed header
        const navbar = document.querySelector('.navbar');
        if (navbar) {
            const navbarHeight = navbar.offsetHeight;
            document.body.style.paddingTop = navbarHeight + 'px';
        }

        // Ensure all icons are visible
        const icons = document.querySelectorAll('.bi');
        icons.forEach(icon => {
            icon.style.display = 'inline-block';
            icon.style.verticalAlign = 'middle';
        });
    } catch (error) {
        console.error('Error loading header:', error);
    }
}

// Load the header when the DOM is fully loaded
document.addEventListener('DOMContentLoaded', loadHeader); 