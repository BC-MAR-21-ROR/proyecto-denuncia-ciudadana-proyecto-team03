import { Controller } from 'stimulus'; 
export default class extends Controller {
  static targets = ['zip_id', 'settlement_id']

  connect() {
    this.changeSettlements();
  }

  changeSettlements() {
    let zip_id = this.zip_idTarget.value;
    let current_value = this.settlement_idTarget.dataset.value;
    // console.log(zip_id)
    if (zip_id) {
      fetch('/zips/'+zip_id+'.json').then(resp => resp.json())
        .then(resp => {
          // console.log(resp);
          this.settlement_idTarget.innerHTML = '';
          this.settlement_idTarget.appendChild(document.createElement("option"));
          resp.settlements.forEach(sett => {
            const option = document.createElement("option");
            option.value = sett.id;
            option.innerHTML = sett.name;
            if (sett.id == current_value) {option.setAttribute('selected', 'selected')}
            this.settlement_idTarget.appendChild(option);
          });
        }).catch(err => {
          console.log(err);
        });
    }
  }
}