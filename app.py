"""
Sample simple application for security-report-demo.
This gives Trivy code/filesystem context to scan.
"""
from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def home():
    return jsonify({
        "project": "security-report-demo",
        "status": "active",
        "description": "Simple app scanned by Trivy and tfsec on GitHub Actions"
    }), 200

@app.route("/health")
def health():
    return jsonify({"status": "ok"}), 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
