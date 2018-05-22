#!/bin/bash

adminpass=$1

echo "Checking Mongo Replica Set......"
prodresult=$(ssh username@host /MONGO/mongo101/product/bin/mongo admin --username admin --password $adminpass --quiet << EOF

    var instances = [ "localhost:27017",
                      "localhost:27018" ];
    ngInst="";
    instances.forEach(function(inst) {
        try {
            var instHealth = rs.status().members.filter(function(rsStatus) { return rsStatus.name == inst && (rsStatus.state == 1 || rsStatus.state == 2);})[0].health;
            if(instHealth != 1) {
                rs.status().members.filter(function(rsStatus) { return rsStatus.name == inst && (rsStatus.state == 1 || rsStatus.state == 2);})[0];
                ngInst = inst + "\n" + ngInst;
            }
        } catch(err) {
            print (err);
            ngInst = inst + "\n" + ngInst;
        }
    });

    if (ngInst != "") throw "These mongo instance(s) are either down or in bad health: " + ngInst;
EOF);
if [ $? != 0 ]; then
    msg="Status check failed for mongo replica set"
    msg+=$prodresult;
    echo $msg;
    to=th.nitendra@gmail.com
    echo $msg|/bin/mail $to -s "[PROD][WARN] Mongo Replica Set Status Check Failed";
fi
ssh username@host /MONGO/mongo101/product/bin/mongostat --discover --authenticationDatabase admin --username admin --password $adminpass -n 1


echo "+++++++++++++++++"
