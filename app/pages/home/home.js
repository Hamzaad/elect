import {Page,EventEmitter} from 'ionic-angular';
import {ORM} from './ORM';


@Page({
  templateUrl: 'build/pages/home/home.html'
})
export class HomePage {
  constructor(){
    this._ORM = new ORM();
    this._ORM.select({
      table:"config"
    })
  }
}
