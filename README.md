# Terraform-Ansible-Wordpress-RDS-Project
- Wordpress만 적용한 버전 : https://github.com/pivipopi/Terraform-Ansible-Wordpress-Project
- Ansible의 playbook을 통해 wordpress를 배포하고, Terraform을 통해 AWS에 인스턴스를 만들고 RDS를 구축한다.

# 기본 설치 - 리눅스 버전
```
# AWS CLlv2 설치
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt install unzip   # 리눅스는 unzip이 안깔려 있기때문에 설치해줘야 한다.
unzip awscliv2.zip
sudo ./aws/install
aws configure            # AWS CLI 구성

# Terraform 설치
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt install terraform
```

# 사용 방법
```
git clone https://github.com/pivipopi/Ansible.git     # 깃 허브에 저장되어 있는 wordpress를 클론으로 불러온다.
ssh-keygen -f my_sshkey -N ''                         # ssh 접속을 위해 인증키가 있어야 한다.
terraform init                                        # 해당 프로젝트 안에서 init를 한다.
terraform terraform validate                          # 유효성 검증
terraform apply -auto-approve                         # 실행
```

# 폴더 설명
- output.tf : 생성한 AWS EC2 인스턴스의 public_ip 속성을 반환한다.
- providr.tf : 프로바이더 요구사항을 정의해 필요한 프로바이더 및 버전을 지정한다.
- security-group.tf : 웹 서버 구성 후 접근 확인하기 위한 보안 그룹 리소스 이며, ssh의 22번 포트, wordpress의 변환 포트, mysql의 3306번 포트를 추가한다.
- variable.tf : 입력 변수를 정의하기 위한 구성 파일이다.

# 디렉토리 구조
```
.
├── group_vars
│   └── common.yaml
├── inventory.ini
├── main.tf
├── my_sshkey
├── my_sshkey.pub
├── output.tf
├── providr.tf
├── roles
│   └── wordpress
│       ├── handlers
│       │   └── main.yaml
│       ├── tasks
│       │   ├── debian.yaml
│       │   ├── main.yaml
│       │   └── redhat.yaml
│       ├── templates
│       │   ├── httpd.conf.j2
│       │   ├── ports.conf.j2
│       │   └── wp-config.php.j2
│       └── vars
│           └── main.yaml
├── security-group.tf
├── site.yaml
├── terraform.tfstate
├── terraform.tfstate.backup
└── variable.tf
```
