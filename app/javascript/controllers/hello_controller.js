import { Controller } from "@hotwired/stimulus"

export default class HelloWorldController extends Controller {
  static targets = ["message"]

  connect() {
    this.setMessage("Hello World!")
  }

  setMessage(message) {
    this.messageTarget.textContent = message
  }
}
