# Customizations

Updated whenever I get a new computer. 

### Installation

If for some reason you want to use my setup:

Pre-requisites:
- Install [Homebrew](https://brew.sh)
- Install Ansible: `brew install ansible`

Command to run from the repo root (it asks for your macOS password, which some cask installers need):

`ansible-playbook macbook-config.yml`

### Notes

- The first run triggers a macOS prompt to let your terminal control System Events (for login
  items). Allow it and re-run if that task failed.
- Dark mode and the disabled Spotlight shortcut take effect after logging out and back in.

- Agent configs under `config/claude`, `config/codex` and `config/cursor-agent` only seed
  `settings.json` / `config.toml` / `cli-config.json` / `mcp.json` when they don't exist yet, since
  the apps rewrite those files themselves.
- The Cursor Datadog MCP server reads `DD_API_KEY` and `DD_APP_KEY` from the environment.
- Raycast extensions, hotkeys and snippets aren't covered here: set a passphrase in Raycast →
  Settings → Advanced, run the "Export Settings & Data" command, then "Import Settings & Data" on the
  new machine. Don't commit the `.rayconfig`.
