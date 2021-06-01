import { Controller } from 'stimulus'; 
export default class extends Controller {
  static targets = ['state_id', 'municipality_id', 'postal_id', 'settlement_id']

  connect(){
  	this.changeChildOptions();
  }

  async changeChildOptions(event){
  	const type = event ? event.target.dataset.type : 'state';
  	const plural_type = this.toPlural(type);
    const element_id = this[`${type}_idTarget`].value;
    const childs_name = this.determineTypeChilds(type);
    const child_field = this.determineChildField(type);
    const child_current_value = this[child_field].dataset.value;

    this[child_field].innerHTML = '';
    this[child_field].appendChild(document.createElement("option"));

    if (element_id) {
      const response = await fetch(`/${plural_type}/${element_id}.json`);
      this.validateResponse(response);
      const childs = await response.json();

      childs[childs_name].forEach(elem => {
        const option = document.createElement("option");
        option.value = elem.id;
        option.innerHTML = elem.name;
        if (elem.id == child_current_value) { option.setAttribute('selected', 'selected') }
        this[child_field].appendChild(option);
      });
    }
    this[child_field].dispatchEvent(new Event('change'));
  }

  toPlural(type){
  	let plural = type;
  	switch (type) {
  		case 'municipality':
  			plural = 'municipalities'
  			break;
  		default:
  			plural = `${type}s`
  			break;
  	}
  	return plural;
  }

  validateResponse(response){
    if (!response.ok) {
      const message = `The following error has occured: ${response.status}`;
      throw new Error(message);
    }
  }

  determineChildField(type){
  	let child_field = '';
  	switch (type) {
  	case 'state':
  		child_field = 'municipality_idTarget';
  		break;
  	case 'municipality':
  		child_field = 'postal_idTarget';
  		break;
  	case 'postal':
  		child_field = 'settlement_idTarget';
  		break;
    }
    return child_field;
  }

  determineTypeChilds(type){
  	let child_type = '';
  	switch (type) {
  	case 'state':
  		child_type = 'municipalities';
  		break;
  	case 'municipality':
  		child_type = 'postals';
  		break;
  	case 'postal':
  		child_type = 'settlements';
  		break;
    }
    return child_type;
  }
}