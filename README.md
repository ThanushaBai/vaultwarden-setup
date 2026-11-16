# Vaultwarden Self-Hosted Deployment

## Architecture & Storage
- **Database Backend:** SQLite (default). Chosen because it requires no external database service and is easier to back up securely for a small internal setup.
- **Storage:** Data is stored in the `vw-data/` directory via a Docker volume mount.
- **What is backed up:** The entire `vw-data/` directory (includes `db.sqlite3`, `rsa_key.pem`, and attachments).
- **Admin Token:** Intentionally left unset. This completely disables the `/admin` page to reduce the attack surface.

## HTTPS & Access
- **Reverse Proxy:** Caddy was initially attempted, but due to local ISP firewall restrictions (port 80/443 blocked), we used a **Cloudflare Tunnel** (`cloudflared`).
- Cloudflare provides automated HTTPS termination and secures traffic without needing to expose home router ports.
- **Live URL:** `https://extras-san-prayers-unavailable.trycloudflare.com`

## Security Status
- **Signups:** Disabled (`SIGNUPS_ALLOWED=false`). Test account created successfully before locking down.
- **Admin Page:** Disabled (404 error on `/admin`).

## Backup & Restore (Proof)
- **Schedule:** A cron job runs daily at 2:00 AM to archive the `vw-data/` folder into `~/vaultwarden-backups/`.
- **Restore Tested:** We deleted the live `vw-data/` directory, extracted the backup tarball, and restarted the container. The test account and password entries persisted successfully.

## License
- **Vaultwarden License:** AGPL-3.0
- **Internal Use:** The AGPL-3.0 license allows internal use without distributing the source code. However, if we modify the Vaultwarden code and host it as a public service, we must share our modifications under the same license.

## Secrets Management
- No secrets (like `ADMIN_TOKEN` or DB passwords) are stored in this repository. 
- If an admin token is ever required, it should be passed via a `.env` file locally, which is ignored by Git.
