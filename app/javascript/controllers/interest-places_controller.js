import { Controller } from 'stimulus'; 
export default class extends Controller {
  static targets = ['postal_id', 'settlement_id']

  connect() {
    this.changeSettlements();
  }

  changeSettlements() {
    let postal_id = this.postal_idTarget.value;
    let current_value = this.settlement_idTarget.dataset.value;
    // console.log(postal_id)
    if (postal_id) {
      fetch('/postals/'+postal_id+'.json').then(resp => resp.json())
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