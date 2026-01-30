import { LightningElement,api } from 'lwc';

export default class ChildComponent extends LightningElement {
    @api childProperty1;
    @api childProperty2;
}