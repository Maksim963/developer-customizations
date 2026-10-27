# Customizations

Updated whenever I get a new computer. 

### Installation

If for some reason you want to use my setup:

Pre-requisites:
- Install Ansible: `brew install ansible`

Command to run:

`ansible-playbook macbook-config.yml`
### Notes

- Agent configs under `config/claude`, `config/codex` and `config/cursor-agent` only seed
  `settings.json` / `config.toml` / `cli-config.json` / `mcp.json` when they don't exist yet, since
  the apps rewrite those files themselves.
- The Cursor Datadog MCP server reads `DD_API_KEY` and `DD_APP_KEY` from the environment.
- Raycast extensions, hotkeys and snippets aren't covered here: use Raycast → Settings → Advanced →
  Export, then import the `.rayconfig` on the new machine.
