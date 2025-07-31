# UbuntuRustBuld

Rust build base Docker container containing Rust toolchain and essential development tools

# Installed Tools
The following tools are pre-installed in this container:

## Rust Toolchain
- **rustc**: Rust compiler
- **cargo**: Rust package manager
- **rustfmt**: Rust code formatter
- **clippy**: Rust linter
- **rust-analyzer**: Rust language server

## Cargo Tools
- **cargo-watch**: File watcher for development
- **cargo-audit**: Security vulnerability scanner
- **cargo-tarpaulin**: Code coverage tool
- **cargo-nextest**: Fast test runner

## System Libraries
- **libcurl4**: HTTP client library for making HTTP requests
- **libssl-dev**: OpenSSL development libraries
- **build-essential**: Essential build tools
- **pkg-config**: Package configuration tool

# Docker Commands
Common Docker commands for building, pushing, and running the container:

```bash
docker build . -t ubuntu-rust-build:latest
docker push pontsho4real/ubuntu-rust-build:latest
```

# Getting WSL to reach Host PC
Commands to configure WSL networking to reach the host PC:

```powershell
Remove-NetFirewallRule -DisplayName "WSL"
netsh interface portproxy add v4tov4 listenport=2375 listenaddress=172.19.32.1 connectport=2375 connectaddress=127.0.0.1 protocol=tcp
New-NetFirewallRule -DisplayName "WSL" -Direction Inbound -InterfaceAlias "vEthernet (WSL (Hyper-V firewall))" -Action Allow
```

# Build and Test

## Using the Container for Rust Development

```bash
# Run the container interactively
docker run --rm -it -v $(pwd):/workspace -w /workspace ubuntu-rust-build:latest

# Create a new Rust project
cargo new my_project
cd my_project

# Build the project
cargo build

# Run tests
cargo test

# Run with code coverage
cargo tarpaulin

# Check for security vulnerabilities
cargo audit

# Format code
cargo fmt

# Lint code
cargo clippy
```

## Development Workflow

The container includes `cargo-watch` for efficient development:

```bash
# Watch for changes and run tests automatically
cargo watch -x test

# Watch for changes and run clippy
cargo watch -x clippy

# Watch for changes and build
cargo watch -x build
```

# Contribute
