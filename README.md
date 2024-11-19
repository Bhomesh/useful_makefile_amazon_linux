<div align="center">

# 🛠️ DevOps Tools Installer for Amazon Linux

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Amazon Linux](https://img.shields.io/badge/Amazon%20Linux-2-orange)](https://aws.amazon.com/amazon-linux-2/)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.com/bhomesh/useful_makefile/graphs/commit-activity)

A powerful Makefile-based toolkit for automating DevOps tool installation on Amazon Linux.

[Key Features](#key-features) •
[Prerequisites](#prerequisites) •
[Installation](#installation) •
[Usage](#usage) •
[Available Tools](#available-tools)

</div>

## 🌟 Key Features

- 🔍 Real-time installation status checking
- 🚀 One-command installation of individual tools
- 🔄 Bulk installation capability
- 💻 Amazon Linux optimization
- 🎨 Color-coded output for better visibility
- 🛡️ Security-focused installation procedures
- 📊 Post-installation verification

## 🔧 Prerequisites

- Amazon Linux 2 or newer
- Root/sudo access
- Internet connection
- Basic command line knowledge

## 📥 Installation

1. Clone the repository:
```bash
git clone https://github.com/bhomesh/useful_makefile.git
cd useful_makefile
```

2. Make the Makefile executable:
```bash
chmod +x Makefile
```

## 🚀 Usage

### Check Tool Status

View all available tools and their installation status:
```bash
make help
```

### Install All Tools

Install all supported tools in one go:
```bash
make install_all
```

### Install Individual Tools

Install specific tools using their respective targets:
```bash
make docker      # Install Docker
make kubectl     # Install Kubectl
make terraform   # Install Terraform
```

## 🧰 Available Tools

### Container & Orchestration
| Tool | Description | Install Command |
|------|-------------|----------------|
| 🐳 Docker | Container platform | `make docker` |
| ☸️ Kubernetes | Container orchestration | `make kubectl` |
| 🚢 Minikube | Local Kubernetes | `make minikube` |
| 📦 Kind | Kubernetes in Docker | `make kind` |

### Cloud Platforms
| Tool | Description | Install Command |
|------|-------------|----------------|
| 📦 AWS CLI | Amazon Web Services CLI | `make awscli` |
| 🌐 GCloud | Google Cloud Platform CLI | `make gcloud` |
| 🔷 Azure CLI | Microsoft Azure CLI | `make azure` |

### Infrastructure as Code
| Tool | Description | Install Command |
|------|-------------|----------------|
| 🏗️ Terraform | Infrastructure as Code | `make terraform` |
| 🎭 Ansible | Configuration Management | `make ansible` |
| 👨‍🍳 Chef | Configuration Management | `make chef` |
| 🎪 Puppet | Configuration Management | `make puppet` |

### Monitoring & Observability
| Tool | Description | Install Command |
|------|-------------|----------------|
| 📊 Prometheus | Monitoring system | `make prometheus` |
| 📈 Grafana | Visualization platform | `make grafana` |
| 🔍 Thanos | Highly available Prometheus | `make thanos` |

### Development Tools
| Tool | Description | Install Command |
|------|-------------|----------------|
| 🐍 Python3 | Python programming | `make python3` |
| 💚 Node.js | JavaScript runtime | `make node` |
| ☕ Java | Java Development Kit | `make java` |
| 🔵 Go | Go programming | `make go` |

### Databases
| Tool | Description | Install Command |
|------|-------------|----------------|
| 🐬 MySQL | SQL Database | `make mysql` |
| 🗄️ PostgreSQL | SQL Database | `make postgres` |
| 🍃 MongoDB | NoSQL Database | `make mongodb` |
| 🔴 Redis | In-memory Database | `make redis` |

## 🔧 Configuration

Most tools require post-installation configuration. Here are some common next steps:

### Docker Configuration
```bash
# Start Docker service
sudo systemctl start docker

# Add current user to docker group
sudo usermod -aG docker $USER
```

### Database Security
```bash
# Secure MySQL installation
sudo mysql_secure_installation

# Configure PostgreSQL
sudo -u postgres psql
```

## 🔍 Troubleshooting

If you encounter issues:

1. Check system requirements:
```bash
make check_system
```

2. Verify your internet connection:
```bash
ping -c 3 google.com
```

3. Update your system:
```bash
sudo yum update -y
```

4. Check logs for specific tools:
```bash
make logs TOOL=docker
```

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- AWS Documentation
- DevOps Community
- Open Source Contributors

---

<div align="center">

Made with ❤️ by [Bhomesh](https://github.com/bhomesh)

</div>
