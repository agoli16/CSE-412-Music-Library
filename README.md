### User Manual: MusicLibrary Web Application

#### Introduction
**MusicLibrary** is a web-based music management platform that allows users to search for songs and artists, view detailed information, add songs to their favorites, and more. 

---

#### Prerequisites
- **Python 3.x** (with Flask and psycopg2 installed)
- **PostgreSQL 9.x or higher**
- **Web browser**
- Basic knowledge of command-line interfaces.

---

#### Setup Instructions

**Step 1: Clone the Repository or Copy Files**
1. Copy all project files to your desired directory on your local machine.

**Step 2: Set Up the Database**
1. Open PostgreSQL and create a database user:
   ```sql
   CREATE ROLE postgres WITH LOGIN PASSWORD 'default';
   CREATE DATABASE dataproject WITH OWNER postgres;
   ```
2. Restore the database:
   ```bash
   psql -U postgres -d dataproject -f /path/to/databaseDump.sql
   ```

**Step 3: Configure the Application**
1. Update the database credentials in `app.py`:
   ```python
   conn = psycopg2.connect(
       dbname="dataproject",
       user="postgres",
       password="default",
       host="localhost"
   )
   ```

**Step 4: Run the Application**
1. Start the Flask server:
   ```bash
   python app.py
   ```
2. Open your web browser and navigate to:
   ```
   http://127.0.0.1:5000
   ```

---

#### Features Overview

1. **Login** (`/login`)  
   - Enter your username and password to access the platform.  
   - Example credentials:
     - **Username:** demo_user  
     - **Password:** password123  

2. **Sign-Up** (`/signup`)  
   - Create an account by providing:
     - Username
     - Email
     - Password

3. **Home** (`/home`)  
   - Explore randomly recommended songs and search for specific songs or artists.  

4. **Search** (`/search`)  
   - Use the search bar to find:
     - Songs by title
     - Artists and their songs  

5. **Song Information** (`/song/<song_id>`)  
   - View detailed song information:
     - Title, Artist, Genre, Release Year, Streams, and more.  
   - Add the song to your favorites.

6. **Artist Information** (`/artist/<artist_id>`)  
   - View artist statistics:
     - Name, Total Songs, Total Albums, Streams, and Followers.  

7. **Favorites** (`/favourites`)  
   - Access your favorite songs list.  
   - Remove songs from favorites.  

8. **Error Handling**
   - Errors during operations are redirected to an error page with descriptive messages.

---

#### Technical Details

**Core File Descriptions:**
1. **`app.py`**  
   - Flask-based application backend handling all routing and database interactions.  

2. **HTML Templates** (stored in the `templates` folder):
   - **`login.html`**: Login page UI.
   - **`signup.html`**: Sign-up page UI.
   - **`home.html`**: Home page UI showcasing songs and search functionality.
   - **`favourites.html`**: Favorites management page.
   - **`song_info.html`**: Song details page.
   - **`artist_info.html`**: Artist details page.
   - **`error.html`**: Error page UI.

**Database Schema**:
- **User**: Manages user accounts.
- **Song**: Stores song information.
- **Artist**: Stores artist information.
- **User_Favorites**: Maps users to their favorite songs.

---

#### Known Issues and Resolutions
1. **Error Adding Favorite**  
   - Ensure a user is logged in before adding songs to favorites.
2. **Database Connection Issues**  
   - Verify the `app.py` database credentials match the PostgreSQL setup.
3. **Error Messages on Operations**  
   - Check the `error.html` page for more details.

---
