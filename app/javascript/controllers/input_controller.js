import { Controller } from "@hotwired/stimulus"

var initValue

// Connects to data-controller="input"
export default class extends Controller {
  static targets = [ "input", "hiddenInput" ]

  connect() {
    // Keep track of initial value
    initValue = this.inputTarget.value
    this.hiddenInputTarget.style.display = "none"
  }

  appearOnChange(event) {
    var element = event.currentTarget
    if (element.value != initValue) {
      this.hiddenInputTarget.style.display = "block"
    } else {
      this.hiddenInputTarget.style.display = "none"
    }
  }
}
