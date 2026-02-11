import { LightningElement } from 'lwc';

export default class ParentComponent extends LightningElement {
    setValue() {
        let inputValue = this.template.querySelector('lightning-input').value;
        this.template.querySelector('c-child-component').childProperty2 = inputValue;
    }

    emptychildproperty(){
        this.template.querySelector('c-child-component').callchildmethod();
    }

    //Child to parent

    childMessage='No Message Resived';

    storeMessage(event){
        this.childMessage = event.detail;
    
    }
}