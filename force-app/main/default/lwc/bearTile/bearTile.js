import { LightningElement, api } from 'lwc';
import ursusResources from '@salesforce/resourceUrl/ursus_park';

export default class BearTile extends LightningElement {

    @api bear;   // 👈 THIS LINE IS MANDATORY FOR TRAILHEAD

    appResources = {
        bearSilhouette: `${ursusResources}/standing-bear-silhouette.png`,
    };

    handleOpenRecordClick() {
        const selectEvent = new CustomEvent('bearview', {
            detail: this.bear.Id
        });
        this.dispatchEvent(selectEvent);
    }
}
