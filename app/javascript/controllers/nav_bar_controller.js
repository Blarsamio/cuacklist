import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="nav-bar"
export default class extends Controller {
  static targets = ["menu", "menuBtn", "menuBtnOpen"];

  toggle() {
    console.log("clicked");
    this.menuBtnTarget.classList.toggle("hidden");
    this.menuBtnOpenTarget.classList.toggle("hidden");
    this.menuTarget.classList.toggle("hidden");
  }
}
