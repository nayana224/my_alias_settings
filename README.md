# my_alias_settings — ROS 2 Humble

Ubuntu 22.04 LTS / ROS 2 Humble 환경에서 사용하는 Bash alias 설정입니다.

[전체 안내](https://github.com/nayana224/my_alias_settings) · [Humble](https://github.com/nayana224/my_alias_settings/tree/humble) · [Jazzy](https://github.com/nayana224/my_alias_settings/tree/jazzy)

## 준비 사항

- Ubuntu 22.04 LTS, Bash, ROS 2 Humble 설치
- `git` 및 ROS 2 패키지를 빌드하려면 `colcon` 설치
- ROS 2와 colcon이 설치되지 않았다면 관련 명령은 동작하지 않습니다.

## 설치 방법

### 1. 저장소 복제 또는 기존 복제본 갱신

처음 설치한다면:

```bash
git clone -b humble https://github.com/nayana224/my_alias_settings.git ~/my_alias_settings
```

이미 `~/my_alias_settings`를 복제했다면 다시 clone하지 않고 아래 명령을 사용합니다. 저장소 내부에서 편집한 미커밋 변경사항이 있다면 먼저 정리하세요.

```bash
cd ~/my_alias_settings
git fetch origin
git switch humble
git pull --ff-only origin humble
```

### 2. 홈 디렉터리에 설치

처음 설치 시 빈 설정 파일을 만들어 위치를 확인할 수 있습니다. 다음 `cp` 명령이 파일을 직접 생성하므로 `touch`는 필수가 아닙니다.

```bash
touch ~/.alias_settings.sh
```

단, **기존 파일이 이미 있으면 `touch`보다 먼저 백업**하세요. 기존 파일을 덮어쓰면 사용자 설정이 사라집니다. 아래 명령은 기존 파일이 있을 때만 타임스탬프를 붙여 백업합니다.

```bash
if [[ -s ~/.alias_settings.sh ]]; then
    cp -a ~/.alias_settings.sh "$HOME/.alias_settings.sh.backup.$(date +%Y%m%d-%H%M%S)"
fi
cp ~/my_alias_settings/.alias_settings.sh ~/.alias_settings.sh
```

### 3. Bash 설정 연결 및 적용

`~/.bashrc` 끝에 한 번만 추가합니다. Conda를 사용하는 경우 Conda 초기화 구문 뒤에 이 설정을 놓으세요.

```bash
grep -qxF 'source ~/.alias_settings.sh' ~/.bashrc || printf '\n%s\n' 'source ~/.alias_settings.sh' >> ~/.bashrc
source ~/.bashrc
```

기존 `~/.bashrc`에 다른 경로로 같은 파일을 source하는 줄이 있다면 중복 실행되지 않도록 하나만 남겨 두세요.

### 4. 설치 확인

```bash
type cb
type srws
type sb
type humble
```

## 주요 명령어

| 명령어 | 동작 |
| --- | --- |
| `humble` | ROS 2 Humble 환경을 현재 셸에 불러오기 |
| `cb` | `colcon build --symlink-install` |
| `srws` | 현재 작업 디렉터리의 `install/setup.bash` 불러오기 |
| `sb` | Bash 설정 다시 불러오기 |


`cb`와 `srws`는 ROS 2 워크스페이스 루트에서 사용하세요. 예시:

```bash
humble
cd ~/ros2_ws
cb
srws
```

## 설정 수정 및 업데이트

직접 추가한 alias는 `~/.alias_settings.sh`에서 편집한 뒤 `sb`로 적용합니다. 저장소 최신 버전으로 갱신할 때는 다음과 같이 먼저 백업하세요.

```bash
cd ~/my_alias_settings
git pull --ff-only origin humble
cp -a ~/.alias_settings.sh "$HOME/.alias_settings.sh.backup.$(date +%Y%m%d-%H%M%S)"
cp .alias_settings.sh ~/.alias_settings.sh
source ~/.bashrc
```

복사 시 직접 수정한 alias는 덮어써집니다. 필요한 사용자 지정 항목은 백업 파일과 비교해 다시 추가하세요.

## 제거

`~/.bashrc`에서 `source ~/.alias_settings.sh` 줄을 삭제한 다음 새 터미널을 여세요. 이후 필요하지 않다면 `~/.alias_settings.sh`와 `~/my_alias_settings` 폴더를 삭제할 수 있습니다. `~/.alias_settings.sh.backup.*` 백업 파일은 필요 여부를 확인한 뒤 정리하세요.
