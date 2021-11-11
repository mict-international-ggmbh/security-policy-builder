#!/bin/bash
cd templates
/home/vortex/src/MiCT/security-policy-builder/bin/psp build -n -c ./config.json -t /home/vortex/src/MiCT/security-policy-builder/templates/ -o /home/vortex/src/MiCT/security-policy-builder/docs -p /home/vortex/src/MiCT/security-policy-builder/partials
cd -
