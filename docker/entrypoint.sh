#!/bin/sh

"${DISCARD_AFTER:=0}"
"${SCAN_EVERY:=0}"
"${NO_3D_ADAPT:=1}"
"${MAX_FEATURE_UPDATES:=900}"
"${CAMERA_ID:=0}"
"${MAX_THREADS:=4}"
"${MODEL:=4}"
"${FACES:=1}"
"${IP:=0.0.0.0}"

python facetracker.py \
    --discard-after "$DISCARD_AFTER" \
    --scan-every "$SCAN_EVERY" \
    --no-3d-adapt "$NO_3D_ADAPT" \
    --max-feature-updates "$MAX_FEATURE_UPDATES" \
    -c "$CAMERA_ID" \
    --max-threads "$MAX_THREADS" \
    --model "$MODEL" \
    --faces "$FACES" \
    --ip "$IP"
