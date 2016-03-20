import {App, Platform} from 'ionic-angular';
import {HomePage} from './pages/home/home';
import {IntroPage} from './pages/intro/intro';
import {ORM} from './ORM';


@App({
  template: '<ion-nav [root]="rootPage"></ion-nav>',
  config: {
    iconMode: 'android',
    modalEnter: 'modal-slide-in',
    modalLeave: 'modal-slide-out',
    pageTransition: 'android'
  }
})
export class MyApp {
  static get parameters() {
    return [[Platform]];
  }

  constructor(platform) {
    this.platform = platform;
    this._ORM = new ORM();
    this._ORM.select({
      table:"config"
    }).then((data)=>{
      const introState = data.res.rows[Object.keys(data.res.rows).filter((elm)=>{return data.res.rows[elm].name =="intro";})[0]].value;
      this.rootPage = (introState)? IntroPage : HomePage;
    },(err)=>{
      console.log(err);
    })
  }
}
