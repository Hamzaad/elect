import {App, Platform} from 'ionic-angular';
import {HomePage} from './pages/home/home';
import {ORM} from './ORM';


@App({
  template: '<ion-nav [root]="rootPage"></ion-nav>',
  config: {} // http://ionicframework.com/docs/v2/api/config/Config/
})
export class MyApp {
  static get parameters() {
    return [[Platform]];
  }

  constructor(platform) {
    this.platform = platform;
    this.ORM = new ORM();
    this.rootPage = HomePage;
  }
}
