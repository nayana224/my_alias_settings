# my_alias_settings — ROS 2 Jazzy

Ubuntu 24.04와 ROS 2 Jazzy에서 사용하는 Bash alias 설정입니다.

[기본 안내](https://github.com/nayana224/my_alias_settings) · [Humble](https://github.com/nayana224/my_alias_settings/tree/humble) · [Jazzy](https://github.com/nayana224/my_alias_settings/tree/jazzy)

## 설치

**1. 저장소 복제**

```bash
cd ~
git clone -b jazzy https://github.com/nayana224/my_alias_settings.git
```

이미 `~/my_alias_settings` 폴더가 있다면 해당 폴더에서 `git fetch origin` 후 `git switch jazzy`로 전환합니다.

**2. 홈 디렉터리의 설정 파일 준비**

```bash
touch ~/.alias_settings.sh
```

기존 설정이 있다면 복사하기 전에 백업합니다.

```bash
cp -a ~/.alias_settings.sh ~/.alias_settings.sh.backup
cp ~/my_alias_settings/.alias_settings.sh ~/.alias_settings.sh
```

`touch`는 설치에 필수는 아닙니다. `cp`가 파일을 생성하며, 기존 내용은 덮어씁니다.

**3. Bash에 연결**

```bash
grep -qxF 'source ~/.alias_settings.sh' ~/.bashrc || echo 'source ~/.alias_settings.sh' >> ~/.bashrc
source ~/.bashrc
```

**4. 확인**

```bash
type cb
type srws
type sb
```

## 사용 방법

| 명령어 | 기능 |
| --- | --- |
| `jazzy` | ROS 2 Jazzy 환경 불러오기 |
| `cb` | `colcon build --symlink-install` |
| `srws` | 현재 워크스페이스의 `install/setup.bash` 불러오기 |
| `sb` | `~/.bashrc` 다시 불러오기 |
| `cisaac` | 기존 셸에서 `isaacsim` Conda 환경 활성화 |\n| `isaac` | ROS 2와 Conda 환경을 서브셸에서 활성화해 Isaac Sim 실행 |

`cb`와 `srws`는 ROS 2 워크스페이스 루트에서 사용하세요.

## Jazzy 및 Isaac Sim 추가 준비\n\n- `rmw_cyclonedds_cpp` 패키지가 설치되어 있어야 합니다(예: `sudo apt install ros-jazzy-rmw-cyclonedds-cpp`).\n- `isaac` 명령은 `conda` 셸 함수와 `isaacsim` 실행 명령이 준비되어 있어야 합니다. 필요하면 `~/.bashrc`에서 Conda 초기화를 먼저 설정하세요.\n- `isaac()`은 서브셸에서 실행하므로 종료 후 현재 셸의 ROS/Conda 환경을 바꾸지 않습니다.\n\n## 설정 수정과 갱신

사용자 설정은 `~/.alias_settings.sh`에서 수정합니다. 수정 후 `sb`를 실행하세요.

저장소의 최신 변경사항을 반영할 때는 기존 사용자 설정을 백업하세요.

```bash
cd ~/my_alias_settings
git pull --ff-only
cp -a ~/.alias_settings.sh ~/.alias_settings.sh.backup
cp .alias_settings.sh ~/.alias_settings.sh
source ~/.bashrc
```

## 제거

`~/.bashrc`에서 `source ~/.alias_settings.sh` 줄을 삭제합니다. 더 이상 필요하지 않다면 `~/.alias_settings.sh`와 복제 폴더를 삭제하세요. 새 터미널에서 적용됩니다.
