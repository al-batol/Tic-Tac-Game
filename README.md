# Flutter XO Game App

This is a basic XO (tic-tac-toe) game app built with Flutter. It has two screens:
1- Player setup screen: Has two text form fields to enter the names of Player X and Player O. When the "Start Game" button is tapped, it navigates to the game screen.
2- Game screen: Displays the 3x3 game board and logic for players to take turns marking X's and O's. It has a "Reset Game" button at the bottom to restart the game.

## The app uses the GetX state management library to store the game state and player information between the two screens.

You should see the player setup screen to enter the names for Player X and Player O. Enter names and tap "Start Game" to begin playing!

## Features:
- Set player names for Player X and Player O.
- Play XO game by tapping cells to place X's and O's.
- Shows game status (X's turn, O's turn, X name wins, O name wins, Draw).
- Reset game button to restart.
- Uses GetX state management to store game state across screens.
