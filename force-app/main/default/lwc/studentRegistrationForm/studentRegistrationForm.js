import { LightningElement, track } from 'lwc';

export default class StudentRegistrationForm extends LightningElement {

    firstName='';
    lastName='';
    email='';

    studentData={};

    @track reactiveStudentData = {};

   handleFirstNameChange(event){
        this.firstName = event.target.value;
        this.studentData.firstName = this.firstName;
        this.reactiveStudentData.firstName = this.firstName;
    }

    handleLastNameChange(event){
        this.lastName = event.target.value;
        this.studentData.lastName = this.lastName;
        this.reactiveStudentData.lastName=this.lastName;
    }
    handleEmailChange(event){
        this.email=event.target.value;
        this.studentData.email=this.email;
        this.reactiveStudentData.email=this.email;
    }


    



}