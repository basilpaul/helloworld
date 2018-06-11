from flask import Flask
from healthcheck import HealthCheck
app = Flask(__name__)

@app.route('/')
def hello_world():
        return 'Hello, World!'

health = HealthCheck(app, "/healthcheck")

def chef_app_health():
	return True, "Health OK"

health.add_check(chef_app_health)

if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0')
