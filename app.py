from flask import Flask, render_template, request, redirect, url_for
import psycopg2

app = Flask(__name__)

current_user_id = None
# Database connection
def get_db_connection():
    conn = psycopg2.connect(
        dbname="dataproject", #database name
        user="postgres",
        password="default",
        host="localhost"
    )
    return conn

# Route: Login Page
@app.route('/')
@app.route('/login', methods=['GET', 'POST'])
def login():
    global current_user_id
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute('SELECT * FROM "User" WHERE username = %s AND password = %s', (username, password))
        user = cursor.fetchone()
        conn.close()

        if user:
            current_user_id = user[0]
            return redirect(url_for('home'))
        else:
            return render_template('error.html', message="Invalid login credentials.")
    return render_template('login.html')

# Route: Sign-Up Page
@app.route('/signup', methods=['GET', 'POST'])
def signup():
    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        password = request.form['password']
        
        conn = get_db_connection()
        cursor = conn.cursor()

        try:
            # Insert only username, email, and password, let the database generate user_id
            cursor.execute('INSERT INTO "User" (username, email, password) VALUES (%s, %s, %s)',
                           (username, email, password))
            conn.commit()
        except psycopg2.IntegrityError as e:
            conn.rollback()
            return render_template('error.html', message="An account with this username or email already exists.")
        finally:
            conn.close()

        return redirect(url_for('login'))
    return render_template('signup.html')

# Route: Home Page
@app.route('/home')
def home():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM Song ORDER BY RANDOM() LIMIT 5')
    songs = cursor.fetchall()
    conn.close()
    return render_template('home.html', songs=songs)

# Route: Search
@app.route('/search', methods=['GET'])
def search():
    query = request.args.get('query')
    conn = get_db_connection()
    cursor = conn.cursor()

    # Search for songs
    cursor.execute("SELECT song_id, title FROM Song WHERE title ILIKE %s", ('%' + query + '%',))
    songs = cursor.fetchall()

    # Search for artists and their songs
    cursor.execute("SELECT artist_id, name FROM Artist WHERE name ILIKE %s", ('%' + query + '%',))
    artists = cursor.fetchall()

    # Attach songs to each artist
    artist_results = []
    for artist in artists:
        cursor.execute("SELECT song_id, title FROM Song WHERE artist_id = %s", (artist[0],))
        artist_songs = cursor.fetchall()
        artist_results.append((artist[0], artist[1], artist_songs))

    conn.close()

    return render_template('home.html', songs=songs, artists=artist_results, search=True, query=query)

# Route: Song Information
@app.route('/song/<int:song_id>')
def song_info(song_id):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('''
        SELECT s.title, a.name AS artist_name, s.genre, s.year_released, s.streams, 
               s.num_favorites, s.duration, substring(s.lyrics from 1 for 100) AS lyrics
        FROM Song s
        JOIN Artist a ON s.artist_id = a.artist_id
        WHERE s.song_id = %s
    ''', (song_id,))
    song = cursor.fetchone()
    conn.close()
    return render_template('song_info.html', song=song, song_id=song_id)

# Route: Add to Favourites
@app.route('/add_favourite', methods=['POST'])
def add_favourite():
    # Fetch the logged-in user ID (this would come from session or authentication logic)
    global current_user_id  # Assuming user_id is stored in the session after login
    
    if not current_user_id:
        return render_template('error.html', message="You must be logged in to add a favourite.")
    
    song_id = request.form.get('song_id')
    
    # Validate that song_id is not empty
    if not song_id:
        return render_template('error.html', message="Invalid song selected.")
    
    conn = get_db_connection()
    cursor = conn.cursor()
    try:
        cursor.execute('INSERT INTO User_Favourites (user_id, song_id) VALUES (%s, %s)', (current_user_id, int(song_id)))
        conn.commit()
    except Exception as e:
        conn.rollback()
        return render_template('error.html', message=f"Error adding song to favourites: {e}")
    finally:
        conn.close()
    
    return redirect(url_for('home'))

# Route: Artist Information
@app.route('/artist/<int:artist_id>')
def artist_info(artist_id):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('''
        SELECT name, total_songs, total_albums, total_streams, num_followers
        FROM Artist WHERE artist_id = %s
    ''', (artist_id,))
    artist = cursor.fetchone()
    conn.close()
    return render_template('artist_info.html', artist=artist)

# Route: User Favourites
@app.route('/favourites')
def favourites():
    global current_user_id
    user_id = current_user_id
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('''
        SELECT s.song_id, s.title
        FROM Song s
        JOIN User_Favourites uf ON s.song_id = uf.song_id
        WHERE uf.user_id = %s
    ''', (user_id,))
    favourites = cursor.fetchall()
    conn.close()
    return render_template('favourites.html', favourites=favourites)

# Route: Remove from Favourites
@app.route('/remove_favourite', methods=['POST'])
def remove_favourite():
    global current_user_id
    user_id = current_user_id  # Fetch current user ID
    song_id = request.form.get('song_id')  # Safely get the song_id from the form

    if not song_id:
        return render_template('error.html', message="Invalid song selected.")

    conn = get_db_connection()
    cursor = conn.cursor()
    try:
        cursor.execute('DELETE FROM User_Favourites WHERE user_id = %s AND song_id = %s', (user_id, int(song_id)))
        conn.commit()
    except Exception as e:
        conn.rollback()
        return render_template('error.html', message=f"Error removing song: {e}")
    finally:
        conn.close()

    return redirect(url_for('favourites'))

# Route: Error Page
@app.errorhandler(500)
@app.errorhandler(404)
def error_page(e):
    return render_template('error.html', message="Something went wrong."), e.code

if __name__ == '__main__':
    app.run(debug=True)
