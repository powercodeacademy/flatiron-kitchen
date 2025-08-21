// Import and register all your controllers from the importmap under controllers/**/*_controller

import { application } from "@hotwired/stimulus-loading"

// Eager load all controllers defined in the import map under controllers/**/*_controller
application.load(definitionsFrom(application))
