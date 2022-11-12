// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "../javascript/controllers"
import "bootstrap"

import { application } from "../javascript/controllers/application.js"

import NavbarController from "../javascript/controllers/navbar_controller.js"
application.register("navbar", NavbarController)
