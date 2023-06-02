import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="change-status"
export default class extends Controller {
  static targets = ["status", "formrefused", "formaccepted"]
  connect() {


    console.log(this.formacceptedTarget)

  }

  accepted(event){
    event.preventDefault()

    fetch(this.formacceptedTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formacceptedTarget)
    })
      .then(response => response.json())
      .then((data) => {


        this.formacceptedTarget.innerHTML = ""
        this.formrefusedTarget.innerHTML = ""
        this.statusTarget.innerHTML = data.status
      })
  }


  refused(event){
    event.preventDefault()

    fetch(this.formacceptedTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formrefusedTarget)
    })
      .then(response => response.json())
      .then((data) => {

        this.formrefusedTarget.innerHTML = ""
        this.formacceptedTarget.innerHTML = ""
        this.statusTarget.innerHTML = data.status
      })
  }


}
