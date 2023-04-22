// Set up the database
db = db.getSiblingDB("final");

// Create the Customers collection with schema validation
db.createCollection("Customers", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: [ "name", "email", "phone", "address" ],
      properties: {
        name: {
          bsonType: "string",
          description: "must be a string and is required"
        },
        email: {
          bsonType: "string",
          description: "must be a string and is required"
        },
        phone: {
          bsonType: "string",
          description: "must be a string and is required"
        },
        address: {
          bsonType: "object",
          required: [ "street", "city", "state", "zip" ],
          properties: {
            street: {
              bsonType: "string",
              description: "must be a string and is required"
            },
            city: {
              bsonType: "string",
              description: "must be a string and is required"
            },
            state: {
              bsonType: "string",
              description: "must be a string and is required"
            },
            zip: {
              bsonType: "string",
              description: "must be a string and is required"
            }
          }
        }
      }
    }
  }
});

// Create the Products and Orders collections without schema validation
db.createCollection("School");
db.createCollection("State");