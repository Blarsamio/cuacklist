import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="nav-bar"
export default class extends Controller {
  static targets = ["menu"];

  toggle() {
    this.element.classList.toggle("hidden");
  }

  connect() {
    const button = document.getElementById("menu-btn");
    button.addEventListener("click", () => {
      this.toggle();
    });
  }
}
