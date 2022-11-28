import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  connect() {
    document.addEventListener('turbo:submit-end', this.handleSubmit)
  }

  disconnect () {
    document.removeEventListener('turbo:submit-end', this.handleSubmit)
  }

  close () {
    this.element.remove()
    this.element.closest('turbo-frame').src = undefined
  }

  handleKeyup(e) {
    if (e.code === "Escape") {
      this.close()
    }
  }

  handleSubmit = (e) => {
    if (e.detail.succes) {
      this.close()
    }
  }
}
