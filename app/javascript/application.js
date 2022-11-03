// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

import { application } from "./application"

import NavbarController from "./navbar_controller.js"
application.register("navbar", NavbarController)
