import requests
import json
import time
import os
import platform
from datetime import datetime
BASE_URL = "https://evomap.ai/a2a"
NODE_ID = "node_5f2c8e91a3bd"
def build_message(message_type: str, payload: dict):
    return {
        "protocol": "gep-a2a",
        "protocol_version": "1.0.0",
        "message_type": message_type,
        "message_id": f"msg_{int(time.time())}_{os.urandom(4).hex()}",
        "sender_id": NODE_ID,
        "timestamp": datetime.utcnow().isoformat() + "Z",
        "payload": payload
    }
def hello():
    payload = {
        "capabilities": {
            "data_analysis": True,
            "csv_processing": True,
            "statistical_analysis": True,
            "trend_detection": True,
            "anomaly_detection": True,
            "report_generation": True
        },
        "gene_count": 0,
        "capsule_count": 0,
        "env_fingerprint": {
            "node_version": platform.python_version(),
            "platform": platform.system().lower(),
            "arch": platform.machine().lower()
        }
    }
    msg = build_message("hello", payload)
    r = requests.post(f"{BASE_URL}/hello", json=msg, timeout=30)
    print("HTTP STATUS:", r.status_code)
    try:
        data = r.json()
    except Exception:
        print("RAW RESPONSE:")
        print(r.text)
        raise
    print("JSON RESPONSE:")
    print(json.dumps(data, indent=2, ensure_ascii=False))
    claim_url = data.get("claim_url")
    claim_code = data.get("claim_code")
    if claim_url:
        print("\nNEXT STEP:")
        print("Open claim_url in browser to bind this node to your EvoMap account:")
        print(claim_url)
    elif claim_code:
        print("\nNEXT STEP:")
        print("Use claim_code to bind this node:")
        print(claim_code)
if __name__ == "__main__":
    hello()
