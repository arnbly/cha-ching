# Team Cupcakes
Team repo for Codepath Group assignment 

## CodePath iOS for Designers: Group Poject

### We're creating a bill-splitting, interpersonal money exchange app with a simple UX and streamlined UI. Our goal is to strip out the unnecessary elements of Splitwise, update its look and feel, and orient interactions towards people.


### Wireframes
<img src='http://i.imgur.com/link/to/your/gif/file.gif' title='Image1 Description' width='' alt='Image1 Description' />
<img src='http://i.imgur.com/link/to/your/gif/file.gif' title='Image2 Description' width='' alt='Image2 Description' />


### Core Use Cases

REQUIRED

Login Flow
1. Splash screen for app
2. Option to Sign Up or Log In
3. Log In Button
4. Sign Up Button

If Logged In/Signed Up...

Onboarding Flow
1. Welcome message/splash screen

Settings
1. Account Settings (avatar, email address)
2. Security Settings
3. Logout
4. Notificaiton Settings

KEY USE CASES

Use case: User should be able to manage who they pay money to, and orient payment towards the people the interact with.
1. Nav Controller - Friends, Groups, Add Expense, Activity, Settings (me)
2. Pressing “Friends” Button from the main nav controller displays:
3. Screen Header 
4. Amount You owe others
5. Amount you are owed
6. Sum of what you owe and what you are owed
7. List View Body
8. List of friends and how much they owe you
9. Tapping a friend will push segue to the detail view for that friend
10. Friends detail view

Use case: User should be able to see detailed information about who they are exchanging funds with.
1. Friend Avatar
2. Friend Name
3. How much they owe you
4. Contact info (phone or email)
5. Settle Up Button
6. Modally present Payment View
7. Show method of payment (Venmo, etc)

Use case: User should be able to easily add an expense and divide it amongst others if needed.
1. Add Expense
2. Pressing “Add Expense +” Button from the main nav controller displays:
3. Modally present Add a Bill screen with list of recent groups and friends to split with and pre-display keyboard
4. Header input field to type name, email, or phone #
5. Recent Selections
6. List of Friends
7. Field to enter a descriptionO
8. Field to enter an amount
9. Option to define how the bill was split (modally present options)
10. Split equally (paid by you)
11. Split equally (paid by other party)
12. Enter specific amount for which party owes what
13. Date Picker Button (Modally Presents), default is today
14. Allows option to repeat bill
15. Button, call to action

Use Case: User should be able to see what exchanges of money have been made in the past.
1. Scrolling List of recent activity made by you and your friends
2. Bills added - maybe in different spots under how much people owe you
3. Payments made - maybe under how much you owe
4. Each items includes: 
  a. Type icon
  b. Name, title, and group activity took place in (Sarah paid Aaron in group Apartment Rent, or You added ‘Internet Bill’ in Apartment Rent)
  c. The amount you paid or you received for payment items, or the amount you will give back or will owe for bill items
  d. Time stamp item took place
  
OPTIONAL USE CASES

  
  


