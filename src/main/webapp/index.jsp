<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Number Guess Game - A simple Java web app to guess a random number.">
    <title>Number Guess Game</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #2d3e50;
            color: #fff;
            padding: 1rem;
            text-align: center;
        }

        main {
            padding: 2rem;
            max-width: 600px;
            margin: auto;
            background-color: #fff;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h1 {
            margin-top: 0;
        }

        form {
            margin-top: 1.5rem;
        }

        input[type="number"],
        input[type="submit"] {
            padding: 0.5rem;
            margin-top: 0.5rem;
            font-size: 1rem;
            width: 100%;
            box-sizing: border-box;
        }

        footer {
            text-align: center;
            padding: 1rem;
            color: #777;
            margin-top: 2rem;
        }
    </style>
</head>

<body>

    <header>
        <h1>🎯 Number Guess Game</h1>
        <p>Try to guess the number I'm thinking of!</p>
    </header>

    <main>
        <section>
            <h2>Enter Your Guess</h2>
            <form action="guess" method="post">
                <label for="number">Guess a number between 1 and 100:</label>
                <input type="number" id="number" name="number" min="1" max="100" required>
                <input type="submit" value="Submit Guess">
            </form>
        </section>
    </main>

    <footer>
        <p>&copy; 2025 Number Guess Game | Java WebApp CI/CD Demo</p>
    </footer>

</body>

</html>