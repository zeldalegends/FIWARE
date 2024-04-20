db = connect("localhost:27017/orionld");
db.createCollection("entities");
db.entities.createIndex({"_id.id": 1}, {unique: true});
db.entities.createIndex({"_id.type": 1});
db.entities.createIndex({"_id.servicePath": 1});
db.entities.createIndex({"attrNames": 1});
db.entities.createIndex({"creDate": 1});
