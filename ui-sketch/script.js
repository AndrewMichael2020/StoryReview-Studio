// StoryReview Studio - UI Sketch JavaScript

// Show specific view (called from buttons)
function showView(viewId) {
    const viewButtons = document.querySelectorAll('.view-btn');
    const views = document.querySelectorAll('.view');
    
    viewButtons.forEach(b => {
        b.classList.remove('active');
        if (b.getAttribute('data-view') === viewId) {
            b.classList.add('active');
        }
    });
    
    views.forEach(v => v.classList.remove('active'));
    const targetView = document.getElementById(viewId);
    if (targetView) {
        targetView.classList.add('active');
    }
}

// Evidence Drawer Toggle
function toggleDrawer() {
    const drawer = document.getElementById('evidence-drawer');
    if (drawer) {
        drawer.style.display = drawer.style.display === 'none' ? 'flex' : 'none';
    }
}

function closeDrawer() {
    const drawer = document.getElementById('evidence-drawer');
    if (drawer) {
        drawer.style.display = 'none';
    }
}

// Initialize all event listeners after DOM is ready
document.addEventListener('DOMContentLoaded', function() {
    // View Navigation
    const viewButtons = document.querySelectorAll('.view-btn');
    const views = document.querySelectorAll('.view');

    viewButtons.forEach(btn => {
        btn.addEventListener('click', function() {
            const targetView = this.getAttribute('data-view');
            showView(targetView);
        });
    });

    // Close drawer on overlay click
    const drawer = document.getElementById('evidence-drawer');
    if (drawer) {
        drawer.addEventListener('click', function(e) {
            if (e.target === this) {
                closeDrawer();
            }
        });
    }

    // Keyboard shortcuts
    document.addEventListener('keydown', function(e) {
        // / for search focus (Dashboard)
        const dashboard = document.getElementById('dashboard');
        if (e.key === '/' && dashboard && dashboard.classList.contains('active')) {
            e.preventDefault();
            const searchInput = document.querySelector('.filters-bar input');
            if (searchInput) {
                searchInput.focus();
            }
        }
        
        // Escape to close drawer
        if (e.key === 'Escape') {
            closeDrawer();
        }
    });

    // Story row click to open story
    document.querySelectorAll('.story-row').forEach(row => {
        row.addEventListener('click', function() {
            showView('seed');
        });
    });

    // Mode tab clicks (within story views)
    document.querySelectorAll('.mode-tab').forEach(tab => {
        tab.addEventListener('click', function() {
            const modeName = this.textContent.toLowerCase();
            showView(modeName);
        });
    });

    // Scene item clicks (DRAFT mode)
    document.querySelectorAll('.scene-item').forEach(item => {
        item.addEventListener('click', function() {
            document.querySelectorAll('.scene-item').forEach(i => i.classList.remove('active'));
            this.classList.add('active');
        });
    });

    // Bundle item clicks (SHAPE mode)
    document.querySelectorAll('.bundle-item').forEach(item => {
        item.addEventListener('click', function() {
            document.querySelectorAll('.bundle-item').forEach(i => i.classList.remove('selected'));
            this.classList.add('selected');
        });
    });

    // Section nav clicks (TEST mode)
    document.querySelectorAll('.section-item').forEach(item => {
        item.addEventListener('click', function() {
            document.querySelectorAll('.section-item').forEach(i => i.classList.remove('active'));
            this.classList.add('active');
        });
    });

    // Settings tab clicks
    document.querySelectorAll('.settings-tab').forEach(tab => {
        tab.addEventListener('click', function() {
            document.querySelectorAll('.settings-tab').forEach(t => t.classList.remove('active'));
            this.classList.add('active');
        });
    });

    // Question card toggle (SEED mode)
    document.querySelectorAll('.question-card').forEach(card => {
        card.addEventListener('click', function() {
            this.classList.toggle('collapsed');
        });
    });

    console.log('StoryReview Studio UI Sketch loaded');
});
