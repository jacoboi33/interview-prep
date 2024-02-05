import subprocess
from flask import Flask

app = Flask(__name__)

@app.route('/')
def index():
    return '''
    <html>
    <body>
    <h1>Automation Script</h1>
    <button onclick="run_script()">Run Script</button>
    <script>
        function run_script() {
            fetch('/run_script');
        }
    </script>
    </body>
    </html>
    '''

@app.route('/run_script')
def run_script():
    subprocess.run(['sh', 'your_script.sh'])
    return 'Script executed successfully!'

if __name__ == '__main__':
    app.run()