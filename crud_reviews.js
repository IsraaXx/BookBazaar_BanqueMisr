db = db.getSiblingDB('bookbazaar_reviews');

// Create
print("Creating a new review:");
const create = db.Reviews.insertOne({
  book_id: 106,
  reviewer: "Fayez",
  rating: 4,
  comment: "Well-written and engaging.",
  created_at: new Date()
});
printjson(create);



// Read
print("Reading reviews by Bob:");
db.Reviews.find({ reviewer: "Bob" }).forEach(printjson);



// UPDATE 
print("Updating Bob's review:");
const update = db.Reviews.updateOne(
  { reviewer: "Bob" },
  {
    $set: {
      rating: 4,
      comment: "Updated: Better than I thought!"
    }
  }
);
printjson(update);



// DELETE 
print("Deleting Anna's review:");
const delete_result = db.Reviews.deleteOne({ reviewer: "Anna" });
printjson(delete_result);

