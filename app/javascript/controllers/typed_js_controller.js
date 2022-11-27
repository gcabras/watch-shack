import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

// Connects to data-controller="typed-js"
export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["No more time wasted browsing", "Pick up suggestions", "Have a perfect Binge Night"],
      typeSpeed: 65,
      loop: false
    })
  }
}
