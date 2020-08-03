Notes to guide development of the backend:

Function of the application is for a user to be able to
create and/or sign in to an account to engage in Tarot
card readings.

The tarot card reading is a simple three-card pull for 
past, present, and future.

The user should then be able to either "refresh" the 
reading and start again or save the reading; relatedly,
users should be able to re-draw a card that's already 
been drawn by simply clicking a "Draw" button again.

A user should be able to access all of their stored 
readings (stored in the backend) from a dedicated
space on the application page by clicking on a "View"
button.  The "view" button will bring populate the 
reading portion of the page with the cards from that
reading.  A user should be able to draw new cards for the 
reading by clicking any of the "Draw" buttons and should
be able to persist any changes to the backend.  The user
should also have the ability to delete cards from the
reading as well as delete the entire reading. 

{The delete a card function shouldn't be necessary because
the PUT will just replace any individual cards; } 

Finally, a user should be able to see "Cards of the 
Day" for AM and PM in a third space on the application 
page that are drawn at random but with the ability to 
force a "Redraw" from a likewise-named button. 

Additional features could include a metrics page 
that collects data from all users (most drawn card, etc.)
or potentially some social functionality like comments 
or likes.  

## New plan for saving cards and readings

Create card on back end each time a user clicks a draw card on the front end;
Delete cards from state and from the backend when cards are clicked;
Associate a reading ID to all created cards on the backend when the user wants to save a reading 