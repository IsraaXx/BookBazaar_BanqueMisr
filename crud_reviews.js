use('bookbazaar_reviews');

// Create

const create = db.Reviews.insertOne({
  book_id: 106,
  reviewer: "Fayez",
  rating: 4,
  comment: "Well-written and engaging.",
  created_at: new Date()
});
printjson(create);



// Read

db.Reviews.find({ reviewer: "Bob" }).forEach(printjson);



// UPDATE 

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

const delete_result = db.Reviews.deleteOne({ reviewer: "Anna" });
printjson(delete_result);

