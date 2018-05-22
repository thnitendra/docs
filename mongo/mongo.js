// Mongo setup
// https://docs.mongodb.com/master/tutorial/deploy-replica-set-for-testing/
//https://docs.mongodb.com/master/tutorial/enforce-keyfile-access-control-in-existing-replica-set/#deploy-repl-set-with-auth

/*
rsconf = {
           _id: "rs0",
           members: [
                      {
                       _id: 0,
                       host: “localhost:27017"
                      }
                    ]
         }

////////////////////////////////////////////////////////
// https://docs.mongodb.com/manual/reference/mongo-shell/

// Usage: mongo {Server without mongodb:// example 127.0.0.1:27017}/{DbName} [-u {Username}] [-p {Password}] < ./mongo-ls.js

// show databases
// show dbs
// db.dashboard_user.find({"_id":"nite"}).pretty();
// db.dashboard_user.find({"_id":"nite"}, {"role": 1, "email": 1, "_id": 0});
// db.dashboard_user.update({"_id": "nite"}, {$set: {"role": "Admin"}})
// db.dashboard_user.update({"_id": "nite"}, {$unset: {"passwordHash":""}});

// db.collection_name.findOne({"createdDate": { $gte: NumberLong("1495016372")}});
// http://www.ruddwire.com/handy-code/date-to-millisecond-calculators/#.WRwpI1OGP_Q
mongo101:PRIMARY> db.collection_name.find({"createdDate": { $gte: NumberLong("1494997239000"), $lte: NumberLong("1495000839000")}}).count();

mongo101:PRIMARY>
// new Date(1500254164000).toString()

// db.collection_name.insert({ "_id" : "nite", "accountType" : "ADMIN", "role" : "ADMIN", "email" : "nite@a.com", "passwordSalt" : "nite", "passwordHash" : "xxxxxxxx", "createdBy" : "nitin" });

// db.api_config_requests.update({"_id":"d1b3098a-fc91-4968-87d7-bfee4dc733cf", "status":"FAILED"}, {$set: {"status":"DONE"}});
// db.api_config_requests.update({"status":"FAILED"}, {$set: {"status":"DONE"}}, {multi: true});
