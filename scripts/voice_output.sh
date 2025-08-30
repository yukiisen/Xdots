#!/bin/sh

# Step 1: Start PipeWire stuff manually (only if not already running)
pgrep pipewire >/dev/null || pipewire &
pgrep pipewire-pulse >/dev/null || pipewire-pulse &
pgrep wireplumber >/dev/null || wireplumber &

sleep 1  # Give it time to spawn properly

# Step 2: Create the virtual sink
pactl unload-module module-null-sink 2>/dev/null
pactl load-module module-null-sink sink_name=VirtualSink

# Step 3: Move all active sink inputs to VirtualSink
for INPUT in $(pactl list sink-inputs short | awk '{print $1}'); do
    pactl move-sink-input "$INPUT" VirtualSink
done

# Step 4: Set the mic source to VirtualSink.monitor
pactl set-default-source VirtualSink.monitor

echo "🐱 Audio streaming to SoundWire is set up!"

