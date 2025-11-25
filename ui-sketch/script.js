// StoryReview Studio - UI Sketch JavaScript

// View Navigation
document.addEventListener('DOMContentLoaded', function() {
    const viewButtons = document.querySelectorAll('.view-btn');
    const views = document.querySelectorAll('.view');

    viewButtons.forEach(btn => {
        btn.addEventListener('click', function() {
            const targetView = this.getAttribute('data-view');
            
            // Update buttons
            viewButtons.forEach(b => b.classList.remove('active'));
            this.classList.add('active');
            
            // Update views
            views.forEach(v => v.classList.remove('active'));
            document.getElementById(targetView).classList.add('active');
        });
    });
});

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
    document.getElementById(viewId).classList.add('active');
}

// Evidence Drawer Toggle
function toggleDrawer() {
    const drawer = document.getElementById('evidence-drawer');
    if (drawer.style.display === 'none') {
        drawer.style.display = 'flex';
    } else {
        drawer.style.display = 'none';
    }
}

function closeDrawer() {
    document.getElementById('evidence-drawer').style.display = 'none';
}

// Close drawer on overlay click
document.getElementById('evidence-drawer')?.addEventListener('click', function(e) {
    if (e.target === this) {
        closeDrawer();
    }
});

// Keyboard shortcuts hint
document.addEventListener('keydown', function(e) {
    // / for search focus (Dashboard)
    if (e.key === '/' && document.getElementById('dashboard').classList.contains('active')) {
        e.preventDefault();
        document.querySelector('.filters-bar input')?.focus();
    }
    
    // Escape to close drawer
    if (e.key === 'Escape') {
        closeDrawer();
    }
});

// Story row click to open story
document.querySelectorAll('.story-row').forEach(row => {
    row.addEventListener('click', function() {
        // In a real app, this would load the story
        // For demo, we'll just switch to SEED mode
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
