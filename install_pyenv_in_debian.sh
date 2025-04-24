#!/bin/bash

# 1. 시스템 패키지 업데이트 및 Python 빌드 의존성 설치
sudo apt update
sudo apt install -y make build-essential libssl-dev zlib1g-dev \
  libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
  libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev \
  libffi-dev liblzma-dev ca-certificates git

# 2. pyenv 설치 (GitHub에서 설치 스크립트 실행)
curl https://pyenv.run | bash

# 3. 환경 변수 설정 (bashrc에 pyenv 설정 추가)
echo -e '\n# pyenv 설정' >> ~/.bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init --path)"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc

# 4. 현재 쉘 세션에 pyenv 경로 적용
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# 5. Python 3.12.2 설치
pyenv install 3.12.2

# 6. 현재 디렉토리에서 pyenv local 설정
pyenv local 3.12.2

# 7. 설치 확인
echo "✅ 설치 완료"
python --version
pyenv version