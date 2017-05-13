Belinda Wong

CPSC 411 Assignment 4

Currency Converter



App with 3 views, homePickerView, foreignPickerView, and favoritesView.


homePickerView has a pickerView and an update button.
The picker allows user to choose a home currency.
The update button is there to update the contents of the picker when the user goes to favoritesView to choose their favorites.
User can swipe left to go to next view.


foreignPickerView has a pickerView, text field, a calculate button, and an update button.
User chooses the foreign currency through the picker.
User enters amount to be converted into the text field.
Click on the calculate button and it should calculate the conversion.  Not working due to problems with YQL implementation.  Will give entered amount and rate shown below the buttons in a label.
Update picker button updates the picker with the selected favorites.
User can swipe right to go back to homePickerView or swipe left to go to favoritesView.


favoritesView has 6 listed currencies.
Each have a switch associated with them.
By default the first 3 currencies are on/selected.
User can click on the switches to choose  their favorites.
Click on the update pickers button so that the favorites are stored.
User can swipe right to go back to foreignPickerView.
