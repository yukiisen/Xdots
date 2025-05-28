#!/bin/bash
# Lock the screen and run suspend in parallel
hyprlock &       # Run hyprlock in the background
systemctl suspend  # Suspend the system immediately
