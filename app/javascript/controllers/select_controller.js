import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select"
export default class extends Controller {
	static targets = ["check", "row", "btns"]
  
	toggleRowChecks() {
		this.rowTargets.forEach((row) => row.checked = this.checkTarget.checked)
		this.showHideBtns(this.checkTarget.checked)
	}

	toggleMainCheck() {
		let checked = this.rowTargets.some((box) => box.checked)
		let unchecked = this.rowTargets.some((box) => !box.checked)
		
		if (checked && unchecked) {
			this.checkTarget.indeterminate = true;
		} else {
			this.checkTarget.indeterminate = false;
			this.checkTarget.checked = checked;
		}

		this.showHideBtns(checked)
	}

	showHideBtns(hidden) {
		if (hidden)
			this.btnsTarget.classList.remove("hidden")
		else
			this.btnsTarget.classList.add("hidden")
	}
}
