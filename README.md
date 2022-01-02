# eds_test
A [Flutter](https://flutter.dev/) app that uses [JSONPlaceholder API](https://jsonplaceholder.typicode.com/) to cache users, posts, comments, albums, and photos locally using [SQLite Database](https://pub.dev/packages/sqflite).

Developed using [Stacked Architecture](https://pub.dev/packages/stacked).

## Requirements
- Make sure you have Flutter SDK 2.15.1 and over
- Internet connection

## Demo
- The main screen shows all user given by the API
  ![Users screen](https://github.com/fishimve/eds/blob/d05763136f0f986b18c940126294cff6aa0b690f/demo/Screenshot_1640918577.png)
- Clicking on the user opens his detailed screen
  ![User's details](https://github.com/fishimve/eds/blob/d05763136f0f986b18c940126294cff6aa0b690f/demo/Screenshot_1640918594.png)
- Clicking on a user's posts widget opens a list of all posts made by this user
  ![User posts](https://github.com/fishimve/eds/blob/d05763136f0f986b18c940126294cff6aa0b690f/demo/Screenshot_1640918598.png)
- Clicking on a specific post opens comments list. 
  ![Post comments](https://github.com/fishimve/eds/blob/d05763136f0f986b18c940126294cff6aa0b690f/demo/Screenshot_1640918601.png)
- Clicking on the 'Create a comment' button opens a create comment screen 
  ![Create a comment](https://github.com/fishimve/eds/blob/d05763136f0f986b18c940126294cff6aa0b690f/demo/Screenshot_1640918634.png)
- Going back to user's details screen, clicking on albums widget opens up user's album list 
  ![Users albums](https://github.com/fishimve/eds/blob/d05763136f0f986b18c940126294cff6aa0b690f/demo/Screenshot_1640918654.png)
- Clicking on the 'Grid' or 'Slideshow' button opens a grid or slideshow of all photos in the album
  ![Photos grid](https://github.com/fishimve/eds/blob/d05763136f0f986b18c940126294cff6aa0b690f/demo/Screenshot_1640918659.png)
  ![Photos slideshow](https://github.com/fishimve/eds/blob/d05763136f0f986b18c940126294cff6aa0b690f/demo/Screenshot_1641084561.png)
