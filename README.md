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


## Installation and Setup 

Ruby version: 3.1.2

1. Clone the repo on Github at: https://github.com/alldigits/simple-warehouse-tech-test, Github cloning instructions: https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository.

2. Open your terminal and navigate to the folder where you cloned and downloaded simple_warehouse to.

3. Type 'bundle install' to install the dependencies including the test suite Rspec.

4. From the terminal enter the following:

- irb -r './lib/simple_warehouse'

5. Then type in the terminal 'warehouse = SimpleWarehouse.new' and press enter.

6. Then 'warehouse.run' and press enter, here you will be presented with all the instructions with a list of the commands available to use the program : ).


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

As a User,
So that I know if the warehouse storage position doesn't exist when storing,
I'd like to receive an error message explaining this

As a User,
So that I know my crate doesn't fit in the space when storing,
I'd like to receive a error message explaining this

As a User,
So that I know a crate doesn't exist when trying to remove crates,
I'd like to receive a error message explaining this

```