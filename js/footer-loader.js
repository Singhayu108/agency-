// Function to load and insert the footer
async function loadFooter() {
    try {
        // First ensure Bootstrap Icons are loaded
        if (!document.querySelector('link[href*="bootstrap-icons"]')) {
            const iconLink = document.createElement('link');
            iconLink.rel = 'stylesheet';
            iconLink.href = 'https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css';
            document.head.appendChild(iconLink);
        }

        // Load footer content
        const response = await fetch('footer.html');
        const footerContent = await response.text();
        
        // Find the footer placeholder
        const footerPlaceholder = document.getElementById('footer');
        if (footerPlaceholder) {
            footerPlaceholder.innerHTML = footerContent;
        } else {
            // Fallback to inserting at the end of body if no placeholder found
            document.body.insertAdjacentHTML('beforeend', footerContent);
        }
        
        // Initialize AOS animations for footer elements
        if (typeof AOS !== 'undefined') {
            // Refresh AOS to detect new elements
            AOS.refresh();
            
            // Add animation to footer elements
            document.querySelectorAll('.footer [data-aos]').forEach(element => {
                element.setAttribute('data-aos-offset', '0');
                element.setAttribute('data-aos-duration', '1000');
            });
        }

        // Ensure all icons are visible
        const icons = document.querySelectorAll('.bi');
        icons.forEach(icon => {
            icon.style.display = 'inline-block';
            icon.style.verticalAlign = 'middle';
        });
    } catch (error) {
        console.error('Error loading footer:', error);
    }
}

// Load the footer when the DOM is fully loaded
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', loadFooter);
} else {
    // DOM is already ready ("interactive" or "complete"), load immediately
    loadFooter();
} 