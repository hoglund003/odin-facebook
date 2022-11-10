import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="fill_out"
export default class extends Controller {
  static targets = [ "input", "warning" ]
  
  displayWarning() {
   this.warningTarget.hidden = false
  }

  hideWarning() {
   this.warningTarget.hidden = true
  }

  setWarning() {
    var filled_out = false
    this.hideWarning()
    // Are all inputs filled out?
    this.inputTargets.forEach(input => {
        
        if (input.value === "") {
          this.displayWarning()
        } else {
          filled_out = true
        }
      if (!filled_out) {
        this.hideWarning()
      }
    })
  }

  connect() {
    console.log("Hello")
    this.setWarning()
  }

  
  test() {
    this.setWarning()
  }
}
