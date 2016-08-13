from pymongo import MongoClient

client = MongoClient()
db = client.test

cursor = db.restaurants.find({"$or": [{"name": "Vella"}, {"name": "Opportunity"}]})

for document in cursor:
   print(document)
