#!/usr/bin/env bash
set -euo pipefail
echo "=== PUPPET SERVER / AGENT PACKAGE CHECK ==="
sudo apt-get update
apt-cache policy puppet-agent puppetserver || true
if ! command -v puppet >/dev/null 2>&1; then
  sudo apt-get install -y puppet-agent puppetserver
fi
PUPPET="$(command -v puppet || true)"
if [[ -z "$PUPPET" && -x /opt/puppetlabs/bin/puppet ]]; then PUPPET=/opt/puppetlabs/bin/puppet; fi
if [[ -z "$PUPPET" ]]; then
  echo "Puppet executable not found. Install Puppet packages for this Ubuntu release."
  exit 1
fi
"$PUPPET" --version
echo "Manifest available at: $(pwd)/site.pp"
echo "For a real master-agent run, configure two distinct hosts and certificate names."
echo "This script checks installation; it does not fake a remote certificate handshake."
