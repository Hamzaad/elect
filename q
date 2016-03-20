warning: LF will be replaced by CRLF in app/pages/home/home.js.
The file will have its original line endings in your working directory.
[1mdiff --git a/app/ORM.js b/app/ORM.js[m
[1mindex eedd22c..0454dfc 100644[m
[1m--- a/app/ORM.js[m
[1m+++ b/app/ORM.js[m
[36m@@ -51,15 +51,9 @@[m [mexport class ORM {[m
           console.error(err);[m
         });[m
   }[m
[31m-  select(data, callback){[m
[32m+[m[32m  select(data){[m
     if(data.table){[m
[31m-      this.storage.query("SELECT " + data.table + " FROM").then((data)=>{[m
[31m-        [m
[31m-      },(err)=>{[m
[31m-        if(callback){[m
[31m-          callback(true, err);[m
[31m-        }[m
[31m-      })[m
[32m+[m[32m      return this.storage.query("SELECT * FROM " + data.table )[m
     }[m
   }[m
 [m
[1mdiff --git a/app/pages/home/home.js b/app/pages/home/home.js[m
[1mindex 1f2eb8d..4b25e6e 100644[m
[1m--- a/app/pages/home/home.js[m
[1m+++ b/app/pages/home/home.js[m
[36m@@ -1,15 +1,33 @@[m
[31m-import {Page,EventEmitter} from 'ionic-angular';[m
[31m-import {ORM} from './ORM';[m
[31m-[m
[32m+[m[32mimport {Page, NavController, NavParams} from 'ionic-angular';[m
[32m+[m[32mimport {ORM} from './../../ORM';[m
[32m+[m[32mimport {IntroPage} from './../intro/intro';[m
[32m+[m[32mconsole.log(IntroPage);[m
 [m
 @Page({[m
   templateUrl: 'build/pages/home/home.html'[m
 })[m
 export class HomePage {[m
[31m-  constructor(){[m
[32m+[m[32m  static get parameters() {[m
[32m+[m[32m    return [[NavController]];[m
[32m+[m[32m  }[m
[32m+[m[32m  constructor(nav){[m
[32m+[m[32m    this.nav = nav;[m
     this._ORM = new ORM();[m
[32m+[m[32m    const self = this;[m
     this._ORM.select({[m
       table:"config"[m
[32m+[m[32m    }).then((data)=>{[m
[32m+[m[32m      console.log(IntroPage);[m
[32m+[m[32m      const introState = data.res.rows[Object.keys(data.res.rows).filter((elm)=>{return data.res.rows[elm].name =="intro";})[0]].value;[m
[32m+[m[32m      if(introState){[m
[32m+[m[32m        console.log(typeof IntroPage);[m
[32m+[m[32m        console.log(self.nav.push);[m
[32m+[m[32m        this.nav.push(IntroPage,{});[m
[32m+[m[32m        //return;[m
[32m+[m[32m      }[m
[32m+[m[32m    },(err)=>{[m
[32m+[m[32m      console.log(err);[m
     })[m
   }[m
[32m+[m
 }[m
[1mdiff --git a/app/pages/intro/intro.html b/app/pages/intro/intro.html[m
[1mindex 2d30763..489e5c1 100644[m
Binary files a/app/pages/intro/intro.html and b/app/pages/intro/intro.html differ
[1mdiff --git a/app/pages/intro/intro.js b/app/pages/intro/intro.js[m
[1mindex 96c8e6d..c7df93e 100644[m
[1m--- a/app/pages/intro/intro.js[m
[1m+++ b/app/pages/intro/intro.js[m
[36m@@ -16,5 +16,6 @@[m [mexport class IntroPage {[m
 [m
   constructor(nav) {[m
     this.nav = nav;[m
[32m+[m[32m    console.log("hihihihi");[m
   }[m
 }[m
warning: LF will be replaced by CRLF in app/pages/intro/intro.js.
The file will have its original line endings in your working directory.
