CREATE TABLE "Ingredients" (
    "Product" TEXT,
    "Price" TEXT
);

CREATE TABLE "Donuts" (
    "Name" TEXT,
    "Gluten-Free" BOOLEAN,
    "Price" INTEGER
);

CREATE TABLE "Orders"(
    "Order_Num" INTEGER ,
    "Donut_Amount" INTEGER,
    "Customer_Id" INTEGER,
    FOREIGN KEY ("Order_Num") REFERENCES Customers("Order_Id")
);

CREATE TABLE "Customers"(
    "Order_Id" INTEGER PRIMARY KEY,
    "First_Name" TEXT,
    "Last_Name" TEXT

);
