// import { LightningElement,api } from 'lwc';

// export default class ChildComponent extends LightningElement {
//     @api childProperty1;
//     @api childProperty2;

//     @api callchildmethod(){
//        // console.log('Child Method Called');
//         this.childProperty2 = '';
//     }
    
//     //send to parent
//     sendToParent(){
//       const inputValue=this.template.querySelector('lightning-input').value;
//       //this.dispatchEvent(new CustomEvent('send',{detail:inputValue}));
//       let evt=new CustomEvent('send',{detail:inputValue});
//       this.dispatchEvent(evt);
//     }
// }