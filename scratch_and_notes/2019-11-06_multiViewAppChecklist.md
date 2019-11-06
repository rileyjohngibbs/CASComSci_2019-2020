# Checklist for creating a Multi-View Application

## Ready the storyboard (Storyboard)

- Delete all storyboard items & corresponding view controller swift files

- Add a TableViewController

- Set the TableViewController as the initialView

- Add a ViewController

- Embed the TableViewController in a Navigation Controller

- Create a show segue from the table cell

- Add the cell reuse identifier

## Add the custom classes (Files / Storyboard)

- Create a new cocoa touch class that extends UITableViewController

- Create a new cocoa touch class that extends UIViewController

- Link the classes in your storyboard

## Configure TableView (Code)

- Set number of sections

- Set number of rows

- Configure cell

## Add variables (Storyboard)

- Create outlets to your text view, button, or other storyboard objects.

## Pass the variables (Code)

- Create a variable in your view controller class to hold whatever is passed from the row in the table

- Modify the prepare for segue method by casting the destination view controller as the name of your custom class

- Pass a reference to your variable

- Do whatever you need to with your variable in the custom View Controller class.
