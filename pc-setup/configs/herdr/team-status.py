#!/usr/bin/env python3
"""Team status for Herdr's tab bar, inspired by Pixel HQ's status bar.

Prints one line such as "⌨ 2 typing · ! 1 needs you · ✓ 3 shipped · ☕ 4 break".
Herdr runs it from ui.tab_bar_right and shows the last line of output; empty
output hides the entry, so nothing is printed when there are no agents.
"""
import json
import os
import shutil
import subprocess
import sys

herdr = os.environ.get("HERDR_BIN_PATH") or shutil.which("herdr") or os.path.expanduser("~/.local/bin/herdr")
try:
    out = subprocess.run([herdr, "agent", "list"], capture_output=True, text=True, timeout=2, check=True).stdout
    agents = json.loads(out)["result"]["agents"]
except Exception:
    sys.exit(1)

counts = {}
for a in agents:
    s = a.get("agent_status", "unknown")
    counts[s] = counts.get(s, 0) + 1

# Order mirrors Pixel HQ: what needs you first, then who is busy.
labels = [
    ("blocked", "! {} needs you"),
    ("working", "⌨ {} typing"),
    ("done", "✓ {} shipped"),
    ("idle", "☕ {} break"),
]
parts = [fmt.format(counts[s]) for s, fmt in labels if counts.get(s)]
if parts:
    print(" · ".join(parts))
