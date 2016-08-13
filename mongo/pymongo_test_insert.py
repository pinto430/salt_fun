from pymongo import MongoClient
from datetime import datetime

client = MongoClient()
db = client.test

result = db.restaurants.insert_one(
    {
        "address": {
            "street": "2 Avenue",
            "zipcode": "10075",
            "building": "1480",
            "coord": [-73.9557413, 40.7720266]
        },
        "borough": "Manhattan",
        "cusine": "Italian",
        "grades": [
            {
                 "date": datetime.strptime("2014-10-01", "%Y-%m-%d"),
                 "grade": "A",
                 "score": 31
            },
            {
                 "date": datetime.strptime("2014-01-16", "%Y-%m-%d"),
                 "grade": "B",
                 "score": 17
            }
        ],
        "name": "Opportunity",
        "restaurant_id": "417046200"
     }
)

print(result.inserted_id)
