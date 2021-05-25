import { Controller } from 'stimulus'; 
export default class extends Controller {
  static targets = ['postal_id', 'settlement_id']

  connect() {
    this.changeSettlements();
  }

  async changeSettlements() {
    const postal_id = this.postal_idTarget.value;
    const current_value = this.settlement_idTarget.dataset.value;
    // console.log(postal_id)
    if (postal_id) {
      const response = await fetch(`/postals/${postal_id}.json`);

      if (!response.ok) {
        const message = `The following error has occured: ${response.status}`;
        throw new Error(message);
      }

      const settlements = await response.json();

      this.settlement_idTarget.innerHTML = '';
      this.settlement_idTarget.appendChild(document.createElement("option"));
      settlements.settlements.forEach(sett => {
        const option = document.createElement("option");
        option.value = sett.id;
        option.innerHTML = sett.name;
        if (sett.id == current_value) {option.setAttribute('selected', 'selected')}
        this.settlement_idTarget.appendChild(option);
      });

    }
  }
}