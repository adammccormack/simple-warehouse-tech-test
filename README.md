# Simple Warehouse
This is a simple command-line warehouse management tool. The user can record the storage and removal of crates of variable sizes on a grid of dynamic 'shelves'.

It accepts the following 7 commands:

| Command | Description |
| --- | --- |
| `help` | Shows the help message. |
| `init W H` | (Re)Initialises the application as an empty W x H warehouse. |
| `store X Y W H P` | Stores a crate of product code P and of size W x H at position (X,Y).<br>The crate will occupy W x H locations on the grid.|
| `locate P` | Show a list of all locations occupied by product code P. |
| `remove X Y` | Remove the entire crate occupying the location (X,Y). |
| `view` | Output a visual representation of the current state of the grid.<br>Position (1,1) should be at the bottom left position on the grid and (1, H) should be the top left. |
| `exit` | Exits the application. |


# User Stories #
```
As a User,
So that I can read the instructions,
I would like to be able to enter a relevant command in the terminal

As a User,
So that I can store products,
I want to be able to create a empty warehouse with a given length and height integer

As a User,
So that I can store product,
I would like to be able to store a crate of a given size in the warehouse

As a User,
So that I can locate a type of product,
I want to be able to see all locations where that product is located

As a User,
So that I can remove a crate of product from the shelf,
I would like to be able to remove the product

As a User,
So that I can view availability of spaces in the warehouse,
I would like to be able to view the warehouse state

As a User,
So that I can end the application,
I would like a exit option


```