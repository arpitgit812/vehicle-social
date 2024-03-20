import { Application } from "@hotwired/stimulus"

// Create a new Stimulus application instance
const application = Application.start()

// Enable or disable debug mode
application.debug = process.env.NODE_ENV !== 'production'

// Assign the application instance to the global window object
window.Stimulus = application

// Export the application instance for testing or other purposes
export { application }
