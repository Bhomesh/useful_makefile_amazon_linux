.SILENT:
# COLORS http://invisible-island.net/xterm/xterm.faq.html#other_versions
RED    := $(shell tput -Txterm setaf 1)
GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
MAGENTA:= $(shell tput -Txterm setaf 5)
CYAN   := $(shell tput -Txterm setaf 6)
WHITE  := $(shell tput -Txterm setaf 7)
RESET  := $(shell tput -Txterm sgr0)

# Check for installed tools
HAS_DOCKER 		:= $(shell command -v docker;)
HAS_ZSH 		:= $(shell command -v zsh;)
HAS_PIP 		:= $(shell command -v pip;)
HAS_CURL 		:= $(shell command -v curl;)
HAS_VIM 		:= $(shell command -v vim;)
HAS_EKSCTL 		:= $(shell command -v eksctl;)
HAS_AWSCLI 		:= $(shell command -v aws;)
HAS_KUBECTL 	:= $(shell command -v kubectl;)
HAS_GCLOUD 		:= $(shell command -v gcloud;)
HAS_AZURE 		:= $(shell command -v az;)
HAS_MINIKUBE 	:= $(shell command -v minikube;)
HAS_KIND 		:= $(shell command -v kind;)
HAS_TERRAFORM 	:= $(shell command -v terraform;)
HAS_ANSIBLE 	:= $(shell command -v ansible;)
HAS_UNZIP 		:= $(shell command -v unzip;)
HAS_PYTHON3 	:= $(shell command -v python3;)
HAS_OMZ := $(shell test -d ~/.oh-my-zsh && echo "yes" || echo "no")
HAS_NVM := $(shell command -v nvm;)
HAS_KUBEADM := $(shell command -v kubeadm;)
HAS_PROMETHEUS := $(shell command -v prometheus;)
HAS_GRAFANA := $(shell command -v grafana-server;)
HAS_SONARQUBE := $(shell command -v sonar-scanner;)
HAS_JENKINS := $(shell command -v jenkins;)
HAS_JAVA := $(shell command -v java;)
HAS_JAVAC := $(shell command -v javac;)
HAS_NODE := $(shell command -v node;)
HAS_NPM := $(shell command -v npm;)
HAS_CODECLIMATE := $(shell command -v codeclimate;)
HAS_HELM := $(shell command -v helm;)
HAS_GLASSCUBE := $(shell command -v glasscube;)
HAS_MYSQL := $(shell command -v mysql;)
HAS_MARIADB := $(shell command -v mariadb;)
HAS_POSTGRES := $(shell command -v psql;)
HAS_REDIS := $(shell command -v redis-server;)
HAS_MONGODB := $(shell command -v mongod;)
HAS_GO := $(shell command -v go;)
HAS_THANOS := $(shell command -v thanos;)
HAS_CHEF := $(shell command -v chef;)
HAS_PUPPET := $(shell command -v puppet;)
HAS_NGINX := $(shell command -v nginx;)
HAS_APACHE := $(shell command -v apache2;)
HAS_MONGODB_COMPASS := $(shell command -v mongodb-compass;)

.DEFAULT_GOAL := help

.PHONY: help prepare dockercli zsh PIP CURL VIM UNZIP EKSCTL AWSCLI KUBECTL GCLOUD AZURE MINIKUBE KIND TERRAFORM ANSIBLE install_all docker zsh pip curl vim unzip eksctl awscli kubectl gcloud azure minikube kind terraform ansible python3 java node npm codeclimate helm glasscube mysql mariadb postgres redis mongodb go thanos chef puppet nginx apache mongodb-compass
help:
	@echo "Usage: make <target>"
	@echo "Targets and Installation Status:"
	@echo "--------------------------------"
	@if command -v docker >/dev/null 2>&1; then \
		echo "  DOCKER              ✅ Installed"; \
	else \
		echo "  DOCKER              ❌ Not Installed"; \
	fi
	@if command -v zsh >/dev/null 2>&1; then \
		echo "  ZSH                 ✅ Installed"; \
	else \
		echo "  ZSH                 ❌ Not Installed"; \
	fi
	@if command -v pip >/dev/null 2>&1; then \
		echo "  PIP                 ✅ Installed"; \
	else \
		echo "  PIP                 ❌ Not Installed"; \
	fi
	@if command -v curl >/dev/null 2>&1; then \
		echo "  CURL                ✅ Installed"; \
	else \
		echo "  CURL                ❌ Not Installed"; \
	fi
	@if command -v vim >/dev/null 2>&1; then \
		echo "  VIM                 ✅ Installed"; \
	else \
		echo "  VIM                 ❌ Not Installed"; \
	fi
	@if command -v unzip >/dev/null 2>&1; then \
		echo "  UNZIP               ✅ Installed"; \
	else \
		echo "  UNZIP               ❌ Not Installed"; \
	fi
	@if command -v eksctl >/dev/null 2>&1; then \
		echo "  EKSCTL              ✅ Installed"; \
	else \
		echo "  EKSCTL              ❌ Not Installed"; \
	fi
	@if command -v aws >/dev/null 2>&1; then \
		echo "  AWSCLI              ✅ Installed"; \
	else \
		echo "  AWSCLI              ❌ Not Installed"; \
	fi
	@if command -v kubectl >/dev/null 2>&1; then \
		echo "  KUBECTL             ✅ Installed"; \
	else \
		echo "  KUBECTL             ❌ Not Installed"; \
	fi
	@if command -v gcloud >/dev/null 2>&1; then \
		echo "  GCLOUD              ✅ Installed"; \
	else \
		echo "  GCLOUD              ❌ Not Installed"; \
	fi
	@if command -v az >/dev/null 2>&1; then \
		echo "  AZURE               ✅ Installed"; \
	else \
		echo "  AZURE               ❌ Not Installed"; \
	fi
	@if command -v minikube >/dev/null 2>&1; then \
		echo "  MINIKUBE            ✅ Installed"; \
	else \
		echo "  MINIKUBE            ❌ Not Installed"; \
	fi
	@if command -v kind >/dev/null 2>&1; then \
		echo "  KIND                ✅ Installed"; \
	else \
		echo "  KIND                ❌ Not Installed"; \
	fi
	@if command -v terraform >/dev/null 2>&1; then \
		echo "  TERRAFORM           ✅ Installed"; \
	else \
		echo "  TERRAFORM           ❌ Not Installed"; \
	fi
	@if command -v ansible >/dev/null 2>&1; then \
		echo "  ANSIBLE             ✅ Installed"; \
	else \
		echo "  ANSIBLE             ❌ Not Installed"; \
	fi
	@if command -v python3 >/dev/null 2>&1; then \
		echo "  PYTHON3             ✅ Installed"; \
	else \
		echo "  PYTHON3             ❌ Not Installed"; \
	fi
	@if command -v nvm >/dev/null 2>&1; then \
		echo "  NVM                 ✅ Installed"; \
	else \
		echo "  NVM                 ❌ Not Installed"; \
	fi
	@if command -v kubeadm >/dev/null 2>&1; then \
		echo "  KUBEADM             ✅ Installed"; \
	else \
		echo "  KUBEADM             ❌ Not Installed"; \
	fi
	@if command -v prometheus >/dev/null 2>&1; then \
		echo "  PROMETHEUS          ✅ Installed"; \
	else \
		echo "  PROMETHEUS          ❌ Not Installed"; \
	fi
	@if command -v grafana-server >/dev/null 2>&1; then \
		echo "  GRAFANA             ✅ Installed"; \
	else \
		echo "  GRAFANA             ❌ Not Installed"; \
	fi
	@if command -v sonar-scanner >/dev/null 2>&1; then \
		echo "  SONARQUBE           ✅ Installed"; \
	else \
		echo "  SONARQUBE           ❌ Not Installed"; \
	fi
	@if command -v jenkins >/dev/null 2>&1; then \
		echo "  JENKINS             ✅ Installed"; \
	else \
		echo "  JENKINS             ❌ Not Installed"; \
	fi
	@if command -v java >/dev/null 2>&1; then \
		echo "  JAVA                ✅ Installed"; \
	else \
		echo "  JAVA                ❌ Not Installed"; \
	fi
	@if command -v node >/dev/null 2>&1; then \
		echo "  NODE                ✅ Installed"; \
	else \
		echo "  NODE                ❌ Not Installed"; \
	fi
	@if command -v npm >/dev/null 2>&1; then \
		echo "  NPM                 ✅ Installed"; \
	else \
		echo "  NPM                 ❌ Not Installed"; \
	fi
	@if command -v codeclimate >/dev/null 2>&1; then \
		echo "  CODECLIMATE         ✅ Installed"; \
	else \
		echo "  CODECLIMATE         ❌ Not Installed"; \
	fi
	@if command -v helm >/dev/null 2>&1; then \
		echo "  HELM                ✅ Installed"; \
	else \
		echo "  HELM                ❌ Not Installed"; \
	fi
	@if command -v glasscube >/dev/null 2>&1; then \
		echo "  GLASSCUBE           ✅ Installed"; \
	else \
		echo "  GLASSCUBE           ❌ Not Installed"; \
	fi
	@if command -v mysql >/dev/null 2>&1; then \
		echo "  MYSQL               ✅ Installed"; \
	else \
		echo "  MYSQL               ❌ Not Installed"; \
	fi
	@if command -v mariadb >/dev/null 2>&1; then \
		echo "  MARIADB             ✅ Installed"; \
	else \
		echo "  MARIADB             ❌ Not Installed"; \
	fi
	@if command -v psql >/dev/null 2>&1; then \
		echo "  POSTGRES            ✅ Installed"; \
	else \
		echo "  POSTGRES            ❌ Not Installed"; \
	fi
	@if command -v redis-server >/dev/null 2>&1; then \
		echo "  REDIS               ✅ Installed"; \
	else \
		echo "  REDIS               ❌ Not Installed"; \
	fi
	@if command -v mongod >/dev/null 2>&1; then \
		echo "  MONGODB             ✅ Installed"; \
	else \
		echo "  MONGODB             ❌ Not Installed"; \
	fi
	@if command -v go >/dev/null 2>&1; then \
		echo "  GO                  ✅ Installed"; \
	else \
		echo "  GO                  ❌ Not Installed"; \
	fi
	@if command -v thanos >/dev/null 2>&1; then \
		echo "  THANOS              ✅ Installed"; \
	else \
		echo "  THANOS              ❌ Not Installed"; \
	fi
	@if command -v chef >/dev/null 2>&1; then \
		echo "  CHEF                ✅ Installed"; \
	else \
		echo "  CHEF                ❌ Not Installed"; \
	fi
	@if command -v puppet >/dev/null 2>&1; then \
		echo "  PUPPET              ✅ Installed"; \
	else \
		echo "  PUPPET              ❌ Not Installed"; \
	fi
	@if command -v nginx >/dev/null 2>&1; then \
		echo "  NGINX               ✅ Installed"; \
	else \
		echo "  NGINX               ❌ Not Installed"; \
	fi
	@if command -v httpd >/dev/null 2>&1; then \
		echo "  APACHE              ✅ Installed"; \
	else \
		echo "  APACHE              ❌ Not Installed"; \
	fi
	@if command -v mongodb-compass >/dev/null 2>&1; then \
		echo "  MONGODB_COMPASS     ✅ Installed"; \
	else \
		echo "  MONGODB_COMPASS     ❌ Not Installed"; \
	fi
	@echo "--------------------------------"
	@echo "Use 'make <target>' to install a specific tool"
	@echo "Use 'make install_all' to install all tools"

.PHONY: install_all
install_all:
	@echo "$(CYAN)Checking and installing required tools...$(RESET)"
	
	@if ! command -v docker &> /dev/null; then \
		echo "$(YELLOW)Installing Docker...$(RESET)"; \
		sudo yum update -y && \
		sudo yum install -y docker && \
		sudo systemctl enable docker && \
		sudo systemctl start docker && \
		sudo usermod -aG docker $${USER}; \
	fi
	
	@if ! command -v zsh &> /dev/null; then \
		echo "$(YELLOW)Installing Zsh...$(RESET)"; \
		sudo yum install -y zsh; \
	fi
	
	@if ! command -v pip &> /dev/null; then \
		echo "$(YELLOW)Installing Pip...$(RESET)"; \
		sudo yum install -y python3-pip; \
	fi
	
	@if ! command -v curl &> /dev/null; then \
		echo "$(YELLOW)Installing Curl...$(RESET)"; \
		sudo yum install -y curl; \
	fi
	
	@if ! command -v vim &> /dev/null; then \
		echo "$(YELLOW)Installing Vim...$(RESET)"; \
		sudo yum install -y vim; \
	fi
	
	@if ! command -v unzip &> /dev/null; then \
		echo "$(YELLOW)Installing Unzip...$(RESET)"; \
		sudo yum install -y unzip; \
	fi
	
	@if ! command -v eksctl &> /dev/null; then \
		echo "$(YELLOW)Installing eksctl...$(RESET)"; \
		curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$$(uname -s)_amd64.tar.gz" | tar xz -C /tmp && \
		sudo mv /tmp/eksctl /usr/local/bin; \
	fi
	
	@if ! command -v aws &> /dev/null; then \
		echo "$(YELLOW)Installing AWS CLI...$(RESET)"; \
		curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
		unzip awscliv2.zip && \
		sudo ./aws/install && \
		rm -rf aws awscliv2.zip; \
	fi
	
	@if ! command -v kubectl &> /dev/null; then \
		echo "$(YELLOW)Installing kubectl...$(RESET)"; \
		curl -LO "https://dl.k8s.io/release/$$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
		sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
		rm kubectl; \
	fi
	
	@if ! command -v gcloud &> /dev/null; then \
		echo "$(YELLOW)Installing Google Cloud SDK...$(RESET)"; \
		sudo yum install -y google-cloud-sdk; \
		echo "$(GREEN)Google Cloud SDK installed successfully.$(RESET)"; \
	else \
		echo "$(GREEN)Google Cloud SDK is already installed.$(RESET)"; \
	fi
	
	@if ! command -v az &> /dev/null; then \
		echo "$(YELLOW)Installing Azure CLI...$(RESET)"; \
		sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc && \
		sudo sh -c 'echo -e "[azure-cli]\nname=Azure CLI\nbaseurl=https://packages.microsoft.com/yumrepos/azure-cli\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/azure-cli.repo' && \
		sudo yum install -y azure-cli; \
		echo "$(GREEN)Azure CLI installed successfully.$(RESET)"; \
	else \
		echo "$(GREEN)Azure CLI is already installed.$(RESET)"; \
	fi
	
	@if ! command -v minikube &> /dev/null; then \
		echo "$(YELLOW)Installing Minikube...$(RESET)"; \
		curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && \
		sudo install minikube-linux-amd64 /usr/local/bin/minikube; \
	fi
	
	@if ! command -v kind &> /dev/null; then \
		echo "$(YELLOW)Installing Kind...$(RESET)"; \
		curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64 && \
		chmod +x ./kind && \
		sudo mv ./kind /usr/local/bin/kind; \
	fi
	
	@if ! command -v terraform &> /dev/null; then \
		echo "$(YELLOW)Installing Terraform...$(RESET)"; \
		sudo yum install -y yum-utils && \
		sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo && \
		sudo yum install -y terraform; \
	fi
	
	@if ! command -v ansible &> /dev/null; then \
		echo "$(YELLOW)Installing Ansible...$(RESET)"; \
		sudo yum update -y && \
		sudo yum install -y python3-pip && \
		sudo pip3 install ansible && \
		echo "$(GREEN)Ansible installed successfully.$(RESET)"; \
		echo "$(YELLOW)Ansible version:$(RESET)"; \
		ansible --version; \
		echo "$(YELLOW)To verify installation, run: ansible --version$(RESET)"; \
	else \
		echo "$(GREEN)Ansible is already installed.$(RESET)"; \
		echo "$(YELLOW)Ansible version:$(RESET)"; \
		ansible --version; \
	fi
	
	@if ! command -v python3 &> /dev/null; then \
		echo "$(YELLOW)Installing Python3...$(RESET)"; \
				sudo yum install -y python3; \
		echo "$(GREEN)Python3 installed successfully.$(RESET)"; \
	else \
		echo "$(GREEN)Python3 is already installed.$(RESET)"; \
	fi
	
	@if ! command -v nvm &> /dev/null; then \
		echo "$(YELLOW)Installing NVM...$(RESET)"; \
		curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash; \
		export NVM_DIR="$$HOME/.nvm"; \
		[ -s "$$NVM_DIR/nvm.sh" ] && \. "$$NVM_DIR/nvm.sh"; \
	fi
	
	@if ! command -v kubeadm &> /dev/null; then \
		echo "$(YELLOW)Installing Kubeadm...$(RESET)"; \
		# Add Kubernetes repository \
		cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo \
[kubernetes] \
name=Kubernetes \
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64 \
enabled=1 \
gpgcheck=1 \
repo_gpgcheck=1 \
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg \
EOF \
		# Set SELinux in permissive mode \
		sudo setenforce 0; \
		sudo sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config; \
		# Install kubeadm, kubelet, and kubectl \
		sudo yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes; \
		# Enable and start kubelet service \
		sudo systemctl enable --now kubelet; \
		echo "$(GREEN)Kubeadm installed successfully.$(RESET)"; \
		echo "$(YELLOW)Kubeadm version:$(RESET)"; \
		kubeadm version; \
		echo "$(YELLOW)Note: You may need to disable swap and configure network settings.$(RESET)"; \
		echo "$(YELLOW)Run 'sudo swapoff -a' to disable swap.$(RESET)"; \
	else \
		echo "$(GREEN)Kubeadm is already installed.$(RESET)"; \
		echo "$(YELLOW)Kubeadm version:$(RESET)"; \
		kubeadm version; \
	fi
	
	@if ! command -v prometheus &> /dev/null; then \
		echo "$(YELLOW)Installing Prometheus...$(RESET)"; \
		sudo yum install -y prometheus; \
	fi
	
	@if ! command -v grafana-server &> /dev/null; then \
		echo "$(YELLOW)Installing Grafana...$(RESET)"; \
		sudo yum install -y grafana; \
	fi
	
	@if ! command -v sonar-scanner &> /dev/null; then \
		echo "$(YELLOW)Installing SonarQube...$(RESET)"; \
		sudo yum install -y sonar-scanner; \
	fi
	
	@if ! command -v jenkins &> /dev/null; then \
		echo "$(YELLOW)Installing Jenkins...$(RESET)"; \
		sudo yum install -y jenkins; \
	fi
	
	@if ! command -v java &> /dev/null || ! command -v javac &> /dev/null; then \
		echo "$(YELLOW)Installing Java JDK...$(RESET)"; \
		sudo yum install -y java-openjdk11; \
		echo "$(GREEN)Java JDK installed successfully.$(RESET)"; \
		echo "$(YELLOW)Java version:$(RESET)"; \
		java -version; \
		echo "$(YELLOW)Java compiler version:$(RESET)"; \
		javac -version; \
	else \
		echo "$(GREEN)Java is already installed.$(RESET)"; \
		echo "$(YELLOW)Java version:$(RESET)"; \
		java -version; \
		echo "$(YELLOW)Java compiler version:$(RESET)"; \
		javac -version; \
	fi
	
	@if ! command -v node &> /dev/null; then \
		echo "$(YELLOW)Installing Node.js...$(RESET)"; \
		curl -sL https://rpm.nodesource.com/setup_lts.x | sudo bash - && \
		sudo yum install -y nodejs; \
	fi
	
	@if ! command -v npm &> /dev/null; then \
		echo "$(YELLOW)Installing NPM...$(RESET)"; \
		sudo yum install -y npm; \
	fi
	
	@if ! command -v codeclimate &> /dev/null; then \
		echo "$(YELLOW)Installing CodeClimate...$(RESET)"; \
		curl -L https://github.com/codeclimate/codeclimate/archive/master.tar.gz | tar xvz && \
		cd codeclimate-master && \
		sudo make install && \
		cd .. && rm -rf codeclimate-master && \
			sudo codeclimate engines:install; \
	fi
	
	@if ! command -v helm &> /dev/null; then \
		echo "$(YELLOW)Installing Helm...$(RESET)"; \
		sudo yum install -y helm; \
	fi
	
	@if ! command -v glasscube &> /dev/null; then \
		echo "$(YELLOW)Installing Glasscube...$(RESET)"; \
		curl -fsSL https://raw.githubusercontent.com/glasscube/glasscube/main/install.sh | sudo bash; \
	fi
	
	@if ! command -v mysql &> /dev/null; then \
		echo "$(YELLOW)Installing MySQL...$(RESET)"; \
		sudo yum install -y mysql mysql-server && \
		sudo systemctl enable mysqld && \
		sudo systemctl start mysqld; \
		echo "$(GREEN)MySQL installed successfully.$(RESET)"; \
		echo "$(YELLOW)Run 'sudo mysql_secure_installation' to secure your installation$(RESET)"; \
	else \
		echo "$(GREEN)MySQL is already installed.$(RESET)"; \
	fi
	
	@if ! command -v mariadb &> /dev/null; then \
		echo "$(YELLOW)Installing MariaDB...$(RESET)"; \
		sudo yum install -y mariadb mariadb-server && \
		sudo systemctl enable mariadb && \
		sudo systemctl start mariadb; \
		echo "$(GREEN)MariaDB installed successfully.$(RESET)"; \
		echo "$(YELLOW)Run 'sudo mysql_secure_installation' to secure your installation$(RESET)"; \
	else \
		echo "$(GREEN)MariaDB is already installed.$(RESET)"; \
	fi
	
	@if ! command -v psql &> /dev/null; then \
		echo "$(YELLOW)Installing PostgreSQL...$(RESET)"; \
		sudo yum install -y postgresql postgresql-contrib && \
		sudo systemctl enable postgresql && \
		sudo systemctl start postgresql; \
		echo "$(GREEN)PostgreSQL installed successfully.$(RESET)"; \
		echo "$(YELLOW)Default superuser: postgres$(RESET)"; \
	else \
		echo "$(GREEN)PostgreSQL is already installed.$(RESET)"; \
	fi
	
	@if ! command -v redis-server &> /dev/null; then \
		echo "$(YELLOW)Installing Redis...$(RESET)"; \
		sudo yum install -y redis; \
	fi
	
	@if ! command -v mongod &> /dev/null; then \
		echo "$(YELLOW)Installing MongoDB...$(RESET)"; \
		sudo yum install -y mongodb-org; \
		sudo systemctl enable mongod && \
		sudo systemctl start mongod; \
		echo "$(GREEN)MongoDB installed successfully.$(RESET)"; \
	else \
		echo "$(GREEN)MongoDB is already installed.$(RESET)"; \
	fi
	
	@if ! command -v go &> /dev/null; then \
		echo "$(YELLOW)Installing Go...$(RESET)"; \
		sudo yum install -y golang; \
		echo "$(GREEN)Go installed successfully.$(RESET)"; \
		echo "$(YELLOW)Go version:$(RESET)"; \
		go version; \
	else \
		echo "$(GREEN)Go is already installed.$(RESET)"; \
		echo "$(YELLOW)Go version:$(RESET)"; \
		go version; \
	fi
	
	@if ! command -v thanos &> /dev/null; then \
		echo "$(YELLOW)Installing Thanos...$(RESET)"; \
		wget https://github.com/thanos-io/thanos/releases/latest/download/thanos-$$(uname -s)-$$(uname -m).tar.gz && \
		tar -xvf thanos-$$(uname -s)-$$(uname -m).tar.gz && \
		sudo mv thanos /usr/local/bin/ && \
		rm thanos-$$(uname -s)-$$(uname -m).tar.gz; \
		echo "$(GREEN)Thanos installed successfully.$(RESET)"; \
	else \
		echo "$(GREEN)Thanos is already installed.$(RESET)"; \
	fi
	
	@if ! command -v chef &> /dev/null; then \
		echo "$(YELLOW)Installing Chef...$(RESET)"; \
		curl -L https://omnitruck.chef.io/install.sh | sudo bash; \
		echo "$(GREEN)Chef installed successfully.$(RESET)"; \
	else \
		echo "$(GREEN)Chef is already installed.$(RESET)"; \
	fi
	
	@if ! command -v puppet &> /dev/null; then \
		echo "$(YELLOW)Installing Puppet...$(RESET)"; \
		wget https://apt.puppetlabs.com/puppet7-release-$$(lsb_release -cs).deb && \
		sudo dpkg -i puppet7-release-$$(lsb_release -cs).deb && \
		sudo yum update && \
		sudo yum install -y puppet-agent && \
		rm puppet7-release-$$(lsb_release -cs).deb; \
		echo "$(GREEN)Puppet installed successfully.$(RESET)"; \
	else \
		echo "$(GREEN)Puppet is already installed.$(RESET)"; \
	fi
	
	@if ! command -v nginx &> /dev/null; then \
		echo "$(YELLOW)Installing Nginx...$(RESET)"; \
		sudo yum install -y nginx; \
	fi
	
	@if ! command -v apache2 &> /dev/null; then \
		echo "$(YELLOW)Installing Apache...$(RESET)"; \
		sudo yum install -y httpd; \
	fi
	
	@if ! command -v mongodb-compass &> /dev/null; then \
		echo "$(YELLOW)Installing MongoDB Compass...$(RESET)"; \
		wget https://downloads.mongodb.com/compass/mongodb-compass_1.40.4_amd64.deb && \
		sudo dpkg -i mongodb-compass_1.40.4_amd64.deb && \
		rm mongodb-compass_1.40.4_amd64.deb; \
	fi
	
	@echo "$(GREEN)All tools have been checked and installed if necessary.$(RESET)"

# Add these new targets after the existing individual check targets

docker:
	@if ! command -v docker &> /dev/null; then \
		echo "$(YELLOW)Installing Docker...$(RESET)"; \
		sudo yum update -y && \
		sudo yum install -y docker && \
		sudo systemctl enable docker && \
		sudo systemctl start docker && \
		sudo usermod -aG docker $${USER}; \
		echo "$(GREEN)Docker installed successfully.$(RESET)"; \
	else \
		echo "$(GREEN)Docker is already installed.$(RESET)"; \
	fi

zsh:
	@if ! command -v zsh &> /dev/null; then \
		echo "$(YELLOW)Installing Zsh...$(RESET)"; \
		sudo yum install -y zsh; \
		echo "$(GREEN)Zsh installed successfully.$(RESET)"; \
	else \
		echo "$(GREEN)Zsh is already installed.$(RESET)"; \
	fi
	@if [ ! -d "$$HOME/.oh-my-zsh" ]; then \
		echo "$(YELLOW)Installing Oh My Zsh...$(RESET)"; \
		sh -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended; \
		echo "$(GREEN)Oh My Zsh installed successfully.$(RESET)"; \
		echo "$(YELLOW)To use Zsh as your default shell, run: chsh -s $$(which zsh)$(RESET)"; \
	else \
		echo "$(GREEN)Oh My Zsh is already installed.$(RESET)"; \
	fi

pip:
	@if ! command -v pip &> /dev/null; then \
		echo "$(YELLOW)Installing Pip...$(RESET)"; \
		sudo yum install -y python3-pip; \
		echo "$(GREEN)Pip installed successfully.$(RESET)"; \
	else \
		echo "$(GREEN)Pip is already installed.$(RESET)"; \
	fi

curl:
	@if ! command -v curl &> /dev/null; then \
		echo "$(YELLOW)Installing Curl...$(RESET)"; \
		sudo yum install -y curl; \
		echo "$(GREEN)Curl installed successfully.$(RESET)"; \
	else \
		echo "$(GREEN)Curl is already installed.$(RESET)"; \
	fi

vim:
	@if ! command -v vim &> /dev/null; then \
		echo "$(YELLOW)Installing Vim...$(RESET)"; \
		sudo yum install -y vim; \
		echo "$(GREEN)Vim installed successfully.$(RESET)"; \
	else \
		echo "$(GREEN)Vim is already installed.$(RESET)"; \
	fi

unzip:
	@if ! command -v unzip &> /dev/null; then \
		echo "$(YELLOW)Installing Unzip...$(RESET)"; \
		sudo yum install -y unzip; \
		echo "$(GREEN)Unzip installed successfully.$(RESET)"; \
	else \
		echo "$(GREEN)Unzip is already installed.$(RESET)"; \
	fi

eksctl:
	@if ! command -v eksctl &> /dev/null; then \
		echo "$(YELLOW)Installing eksctl...$(RESET)"; \
		curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$$(uname -s)_amd64.tar.gz" | tar xz -C /tmp && \
		sudo mv /tmp/eksctl /usr/local/bin; \
		echo "$(GREEN)eksctl installed successfully.$(RESET)"; \
	else \
		echo "$(GREEN)eksctl is already installed.$(RESET)"; \
	fi

awscli:
	@if ! command -v aws &> /dev/null; then \
		echo "$(YELLOW)Installing AWS CLI...$(RESET)"; \
			curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
		unzip awscliv2.zip && \
		sudo ./aws/install && \
		rm -rf aws awscliv2.zip; \
		echo "$(GREEN)AWS CLI installed successfully.$(RESET)"; \
	else \
		echo "$(GREEN)AWS CLI is already installed.$(RESET)"; \
	fi

kubectl:
	@if ! command -v kubectl &> /dev/null; then \
		echo "$(YELLOW)Installing kubectl...$(RESET)"; \
		curl -LO "https://dl.k8s.io/release/$$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
		sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
		rm kubectl; \
		echo "$(GREEN)kubectl installed successfully.$(RESET)"; \
	else \
		echo "$(GREEN)kubectl is already installed.$(RESET)"; \
	fi

gcloud:
	@if ! command -v gcloud &> /dev/null; then \
		echo "$(YELLOW)Installing Google Cloud SDK...$(RESET)"; \
		sudo yum install -y google-cloud-sdk; \
		echo "$(GREEN)Google Cloud SDK installed successfully.$(RESET)"; \
	else \
		echo "$(GREEN)Google Cloud SDK is already installed.$(RESET)"; \
	fi

azure:
	@if ! command -v az &> /dev/null; then \
		echo "$(YELLOW)Installing Azure CLI...$(RESET)"; \
		sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc && \
		sudo sh -c 'echo -e "[azure-cli]\nname=Azure CLI\nbaseurl=https://packages.microsoft.com/yumrepos/azure-cli\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/azure-cli.repo' && \
		sudo yum install -y azure-cli; \
		echo "$(GREEN)Azure CLI installed successfully.$(RESET)"; \
		echo "$(YELLOW)Run 'az login' to authenticate with Azure$(RESET)"; \
	else \
		echo "$(GREEN)Azure CLI is already installed.$(RESET)"; \
	fi

minikube:
	@if ! command -v minikube &> /dev/null; then \
		echo "$(YELLOW)Installing Minikube...$(RESET)"; \
		curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && \
		sudo install minikube-linux-amd64 /usr/local/bin/minikube; \
		echo "$(GREEN)Minikube installed successfully.$(RESET)"; \
	else \
		echo "$(GREEN)Minikube is already installed.$(RESET)"; \
	fi

kind:
	@if ! command -v kind &> /dev/null; then \
		echo "$(YELLOW)Installing Kind...$(RESET)"; \
		curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64 && \
		chmod +x ./kind && \
		sudo mv ./kind /usr/local/bin/kind; \
		echo "$(GREEN)Kind installed successfully.$(RESET)"; \
	else \
		echo "$(GREEN)Kind is already installed.$(RESET)"; \
	fi


ansible:
	@if ! command -v ansible &> /dev/null; then \
		echo "$(YELLOW)Installing Ansible...$(RESET)"; \
		sudo yum update -y && \
		sudo yum install -y python3-pip && \
		sudo pip3 install ansible && \
		echo "$(GREEN)Ansible installed successfully.$(RESET)"; \
		echo "$(YELLOW)Ansible version:$(RESET)"; \
		ansible --version; \
		echo "$(YELLOW)To verify installation, run: ansible --version$(RESET)"; \
	else \
		echo "$(GREEN)Ansible is already installed.$(RESET)"; \
		echo "$(YELLOW)Ansible version:$(RESET)"; \
		ansible --version; \
	fi
terraform:
	@if ! command -v terraform &> /dev/null; then \
		echo "$(YELLOW)Installing Terraform...$(RESET)"; \
		sudo yum install -y yum-utils && \
		sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo && \
		sudo yum install -y terraform; \
	fi

chrome:
	sudo yum install -y google-chrome-stable

brave:
	sudo yum install -y brave-browser

python3:
	@if ! command -v python3 &> /dev/null; then \
		echo "$(YELLOW)Installing Python3...$(RESET)"; \
		sudo yum install -y python3; \
		echo "$(GREEN)Python3 installed successfully.$(RESET)"; \
	else \
		echo "$(GREEN)Python3 is already installed.$(RESET)"; \
	fi

nvm:
	@if ! command -v nvm &> /dev/null; then \
		echo "$(YELLOW)Installing NVM...$(RESET)"; \
		curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash; \
		export NVM_DIR="$$HOME/.nvm"; \
		[ -s "$$NVM_DIR/nvm.sh" ] && \. "$$NVM_DIR/nvm.sh"; \
		echo "$(GREEN)NVM installed successfully.$(RESET)"; \
		echo "$(YELLOW)Please restart your terminal or run: source ~/.bashrc$(RESET)"; \
	else \
		echo "$(GREEN)NVM is already installed.$(RESET)"; \
	fi

kubeadm:
	@if ! command -v kubeadm &> /dev/null; then \
		echo "$(YELLOW)Installing Kubeadm...$(RESET)"; \
		# Add Kubernetes repository \
		cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo \
[kubernetes] \
name=Kubernetes \
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64 \
enabled=1 \
gpgcheck=1 \
repo_gpgcheck=1 \
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg \
EOF \
		# Set SELinux in permissive mode \
		sudo setenforce 0; \
		sudo sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config; \
		# Install kubeadm, kubelet, and kubectl \
		sudo yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes; \
		# Enable and start kubelet service \
		sudo systemctl enable --now kubelet; \
		echo "$(GREEN)Kubeadm installed successfully.$(RESET)"; \
		echo "$(YELLOW)Kubeadm version:$(RESET)"; \
		kubeadm version; \
		echo "$(YELLOW)Note: You may need to disable swap and configure network settings.$(RESET)"; \
		echo "$(YELLOW)Run 'sudo swapoff -a' to disable swap.$(RESET)"; \
	else \
		echo "$(GREEN)Kubeadm is already installed.$(RESET)"; \
		echo "$(YELLOW)Kubeadm version:$(RESET)"; \
		kubeadm version; \
	fi

prometheus:
	@if ! command -v prometheus &> /dev/null; then \
		echo "$(YELLOW)Installing Prometheus...$(RESET)"; \
		sudo yum install -y prometheus; \
	fi

grafana:
	@if ! command -v grafana-server &> /dev/null; then \
		echo "$(YELLOW)Installing Grafana...$(RESET)"; \
		sudo yum install -y grafana; \
	fi

sonarqube:
	@if ! command -v sonar-scanner &> /dev/null; then \
		echo "$(YELLOW)Installing SonarQube...$(RESET)"; \
		sudo yum install -y sonar-scanner; \
	fi

jenkins:
	@if ! command -v jenkins &> /dev/null; then \
		echo "$(YELLOW)Installing Jenkins...$(RESET)"; \
		sudo yum install -y jenkins; \
	fi

java:
	@if ! command -v java &> /dev/null || ! command -v javac &> /dev/null; then \
		echo "$(YELLOW)Installing Java JDK...$(RESET)"; \
		sudo yum install -y java-openjdk11; \
		echo "$(GREEN)Java JDK installed successfully.$(RESET)"; \
		echo "$(YELLOW)Java version:$(RESET)"; \
		java -version; \
		echo "$(YELLOW)Java compiler version:$(RESET)"; \
		javac -version; \
	else \
		echo "$(GREEN)Java is already installed.$(RESET)"; \
		echo "$(YELLOW)Java version:$(RESET)"; \
		java -version; \
		echo "$(YELLOW)Java compiler version:$(RESET)"; \
		javac -version; \
	fi

node:
	@if ! command -v node &> /dev/null; then \
		echo "$(YELLOW)Installing Node.js...$(RESET)"; \
		curl -sL https://rpm.nodesource.com/setup_lts.x | sudo bash - && \
		sudo yum install -y nodejs; \
		echo "$(GREEN)Node.js installed successfully.$(RESET)"; \
		echo "$(YELLOW)Node.js version:$(RESET)"; \
		node --version; \
	else \
		echo "$(GREEN)Node.js is already installed.$(RESET)"; \
		echo "$(YELLOW)Node.js version:$(RESET)"; \
		node --version; \
	fi

npm:
	@if ! command -v npm &> /dev/null; then \
		echo "$(YELLOW)Installing NPM...$(RESET)"; \
		sudo yum install -y npm; \
		echo "$(GREEN)NPM installed successfully.$(RESET)"; \
		echo "$(YELLOW)NPM version:$(RESET)"; \
		npm --version; \
	else \
		echo "$(GREEN)NPM is already installed.$(RESET)"; \
		echo "$(YELLOW)NPM version:$(RESET)"; \
		npm --version; \
	fi

codeclimate:
	@if ! command -v codeclimate &> /dev/null; then \
		echo "$(YELLOW)Installing CodeClimate...$(RESET)"; \
		curl -L https://github.com/codeclimate/codeclimate/archive/master.tar.gz | tar xvz && \
		cd codeclimate-master && \
		sudo make install && \
		cd .. && rm -rf codeclimate-master && \
			sudo codeclimate engines:install; \
		echo "$(GREEN)CodeClimate installed successfully.$(RESET)"; \
		echo "$(YELLOW)Run 'codeclimate help' for usage information$(RESET)"; \
	else \
		echo "$(GREEN)CodeClimate is already installed.$(RESET)"; \
	fi

helm:
	@if ! command -v helm &> /dev/null; then \
		echo "$(YELLOW)Installing Helm...$(RESET)"; \
		sudo yum install -y helm; \
	fi

glasscube:
	@if ! command -v glasscube &> /dev/null; then \
		echo "$(YELLOW)Installing Glasscube...$(RESET)"; \
		curl -fsSL https://raw.githubusercontent.com/glasscube/glasscube/main/install.sh | sudo bash; \
		echo "$(GREEN)Glasscube installed successfully.$(RESET)"; \
		echo "$(YELLOW)Run 'glasscube --help' for usage information$(RESET)"; \
	else \
		echo "$(GREEN)Glasscube is already installed.$(RESET)"; \
	fi

mysql:
	@if ! command -v mysql &> /dev/null; then \
		echo "$(YELLOW)Installing MySQL...$(RESET)"; \
		sudo yum install -y mysql mysql-server && \
		sudo systemctl enable mysqld && \
		sudo systemctl start mysqld; \
		echo "$(GREEN)MySQL installed successfully.$(RESET)"; \
		echo "$(YELLOW)Run 'sudo mysql_secure_installation' to secure your installation$(RESET)"; \
	else \
		echo "$(GREEN)MySQL is already installed.$(RESET)"; \
	fi

mariadb:
	@if ! command -v mariadb &> /dev/null; then \
		echo "$(YELLOW)Installing MariaDB...$(RESET)"; \
		sudo yum install -y mariadb mariadb-server && \
		sudo systemctl enable mariadb && \
		sudo systemctl start mariadb; \
		echo "$(GREEN)MariaDB installed successfully.$(RESET)"; \
		echo "$(YELLOW)Run 'sudo mysql_secure_installation' to secure your installation$(RESET)"; \
	else \
		echo "$(GREEN)MariaDB is already installed.$(RESET)"; \
	fi

postgres:
	@if ! command -v psql &> /dev/null; then \
		echo "$(YELLOW)Installing PostgreSQL...$(RESET)"; \
		sudo yum install -y postgresql postgresql-contrib && \
		sudo systemctl enable postgresql && \
		sudo systemctl start postgresql; \
		echo "$(GREEN)PostgreSQL installed successfully.$(RESET)"; \
		echo "$(YELLOW)Default superuser: postgres$(RESET)"; \
	else \
		echo "$(GREEN)PostgreSQL is already installed.$(RESET)"; \
	fi

redis:
	@if ! command -v redis-server &> /dev/null; then \
		echo "$(YELLOW)Installing Redis...$(RESET)"; \
		sudo yum install -y redis; \
	fi

mongodb:
	@if ! command -v mongod &> /dev/null; then \
		echo "$(YELLOW)Installing MongoDB...$(RESET)"; \
		sudo yum install -y mongodb-org; \
		sudo systemctl enable mongod && \
		sudo systemctl start mongod; \
		echo "$(GREEN)MongoDB installed successfully.$(RESET)"; \
	else \
		echo "$(GREEN)MongoDB is already installed.$(RESET)"; \
	fi

go:
	@if ! command -v go &> /dev/null; then \
		echo "$(YELLOW)Installing Go...$(RESET)"; \
		sudo yum install -y golang; \
		echo "$(GREEN)Go installed successfully.$(RESET)"; \
		echo "$(YELLOW)Go version:$(RESET)"; \
		go version; \
	else \
		echo "$(GREEN)Go is already installed.$(RESET)"; \
		echo "$(YELLOW)Go version:$(RESET)"; \
		go version; \
	fi

thanos:
	@if ! command -v thanos &> /dev/null; then \
		echo "$(YELLOW)Installing Thanos...$(RESET)"; \
		wget https://github.com/thanos-io/thanos/releases/latest/download/thanos-$$(uname -s)-$$(uname -m).tar.gz && \
		tar -xvf thanos-$$(uname -s)-$$(uname -m).tar.gz && \
		sudo mv thanos /usr/local/bin/ && \
		rm thanos-$$(uname -s)-$$(uname -m).tar.gz; \
		echo "$(GREEN)Thanos installed successfully.$(RESET)"; \
	else \
		echo "$(GREEN)Thanos is already installed.$(RESET)"; \
	fi

chef:
	@if ! command -v chef &> /dev/null; then \
		echo "$(YELLOW)Installing Chef...$(RESET)"; \
		curl -L https://omnitruck.chef.io/install.sh | sudo bash; \
		echo "$(GREEN)Chef installed successfully.$(RESET)"; \
	else \
		echo "$(GREEN)Chef is already installed.$(RESET)"; \
	fi

puppet:
	@if ! command -v puppet &> /dev/null; then \
		echo "$(YELLOW)Installing Puppet...$(RESET)"; \
		wget https://apt.puppetlabs.com/puppet7-release-$$(lsb_release -cs).deb && \
		sudo dpkg -i puppet7-release-$$(lsb_release -cs).deb && \
		sudo yum update && \
		sudo yum install -y puppet-agent && \
		rm puppet7-release-$$(lsb_release -cs).deb; \
		echo "$(GREEN)Puppet installed successfully.$(RESET)"; \
	else \
		echo "$(GREEN)Puppet is already installed.$(RESET)"; \
	fi

nginx:
	@if ! command -v nginx &> /dev/null; then \
		echo "$(YELLOW)Installing Nginx...$(RESET)"; \
		sudo yum install -y nginx; \
	fi

apache:
	@if ! command -v apache2 &> /dev/null; then \
		echo "$(YELLOW)Installing Apache...$(RESET)"; \
		sudo yum install -y httpd; \
	fi

mongodb-compass:
	@if ! command -v mongodb-compass &> /dev/null; then \
		echo "$(YELLOW)Installing MongoDB Compass...$(RESET)"; \
		wget https://downloads.mongodb.com/compass/mongodb-compass_1.40.4_amd64.deb && \
		sudo dpkg -i mongodb-compass_1.40.4_amd64.deb && \
		rm mongodb-compass_1.40.4_amd64.deb; \
		echo "$(GREEN)MongoDB Compass installed successfully.$(RESET)"; \
		echo "$(YELLOW)Launch MongoDB Compass from your applications menu$(RESET)"; \
	else \
		echo "$(GREEN)MongoDB Compass is already installed.$(RESET)"; \
	fi

