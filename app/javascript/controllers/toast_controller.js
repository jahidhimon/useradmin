import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toast"
export default class extends Controller {
	connect() {
		console.log("connected toast")
		setTimeout(() => {
			this.element.classList.add("hidden")
		}, 3000)
	}
}
