# Placeholder for iperf3 + fping performance test runners 

import subprocess
import time
import csv
from datetime import datetime

# List of endpoints (name, IP)
endpoints = [
    ("aws", "aws_vm_ip"),
    ("azure", "azure_vm_ip"),
    ("gcp", "gcp_vm_ip")
]

RESULTS_FILE = "mesh_results.csv"
INTERVAL_SECONDS = 300  # 5 minutes

# Run iperf3 bandwidth test (client mode)
def run_iperf3(server_ip):
    try:
        result = subprocess.run([
            "iperf3", "-c", server_ip, "-t", "10", "-J"
        ], capture_output=True, text=True, timeout=20)
        # Parse JSON output for Mbps
        import json
        data = json.loads(result.stdout)
        mbps = data['end']['sum_received']['bits_per_second'] / 1e6
        return round(mbps, 2)
    except Exception as e:
        print(f"iperf3 error: {e}")
        return None

# Run fping latency test
def run_fping(target_ip):
    try:
        result = subprocess.run([
            "fping", "-c", "5", target_ip
        ], capture_output=True, text=True, timeout=10)
        # Parse output for avg latency
        for line in result.stdout.splitlines():
            if "avg" in line:
                avg = line.split("/")[-3]
                return float(avg)
        return None
    except Exception as e:
        print(f"fping error: {e}")
        return None

# Log results to CSV
def log_results(filename, data):
    header = ["timestamp", "src", "dst", "bandwidth_mbps", "latency_ms"]
    file_exists = False
    try:
        with open(filename, "r") as f:
            file_exists = True
    except FileNotFoundError:
        pass
    with open(filename, "a", newline="") as csvfile:
        writer = csv.writer(csvfile)
        if not file_exists:
            writer.writerow(header)
        writer.writerow(data)

if __name__ == "__main__":
    while True:
        timestamp = datetime.utcnow().isoformat()
        for src_name, src_ip in endpoints:
            for dst_name, dst_ip in endpoints:
                if src_ip != dst_ip:
                    print(f"Testing {src_name} → {dst_name}")
                    bw = run_iperf3(dst_ip)
                    latency = run_fping(dst_ip)
                    log_results(RESULTS_FILE, [timestamp, src_name, dst_name, bw, latency])
        print(f"Sleeping for {INTERVAL_SECONDS // 60} minutes...")
        time.sleep(INTERVAL_SECONDS) 