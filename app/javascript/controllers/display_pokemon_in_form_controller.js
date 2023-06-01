import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display-pokemon-in-form"
export default class extends Controller {

  static targets =["pokemon"]
  connect(){
    console.log(this.pokemonTarget.dataset.id)
  }
  display(){
    this.pokemonTargets.forEach(pokemon => {
      if (pokemon.dataset.id === event.currentTarget.value){
        pokemon.classList.remove("d-none")
      } else {
        pokemon.classList.add("d-none")
      }
    });
    console.log(event.currentTarget.value)
  }
}
