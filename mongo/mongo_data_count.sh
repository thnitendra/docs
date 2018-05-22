#!/bin/bash

#  Execute from shell:   mongo < Documents/mongo.js 

use admin;
	
var coll = db.getCollectionNames();
var cnt = [];
var _longest = 0;

for(var i = 0; i < coll.length; i++){
  var name = coll[i];
  if(name.substr(0, 6) != 'system') {
  	cnt[i] = [name, db[name].count()];
	if(name.length > _longest) {
	_longest = name.length
	}
  }
}

_longest++;

print('Collections|COUNT' );
for(var i = 0; i < cnt.length; i++){
	print(cnt[i][0] + Array(_longest-cnt[i][0].length).join(' ') + "|" + cnt[i][1]);
}
