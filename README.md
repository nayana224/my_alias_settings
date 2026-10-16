# my_alias_settings

Ubuntu에서 ROS 2 개발 시 반복 사용하는 Bash 명령어를 편리하게 실행하는 설정 모음입니다.

## 환경 선택

| 브랜치 | Ubuntu | ROS 2 | 설치 안내 |
| --- | --- | --- | --- |
| [humble](https://github.com/nayana224/my_alias_settings/tree/humble) | 22.04 LTS | Humble | [README](https://github.com/nayana224/my_alias_settings/blob/humble/README.md) |
| [jazzy](https://github.com/nayana224/my_alias_settings/tree/jazzy) | 24.04 LTS | Jazzy | [README](https://github.com/nayana224/my_alias_settings/blob/jazzy/README.md) |

**설치 전에 위의 환경별 README를 확인하세요.** 각 브랜치에는 전용 `.alias_settings.sh`, 설치·업데이트·제거 방법과 필요한 패키지 설명이 있습니다.

## 빠른 시작 (Jazzy 예시)

```bash
git clone -b jazzy https://github.com/nayana224/my_alias_settings.git ~/my_alias_settings
if [[ -e ~/.alias_settings.sh ]]; then
    cp -a ~/.alias_settings.sh "$HOME/.alias_settings.sh.backup.$(date +%Y%m%d-%H%M%S)"
fi
cp ~/my_alias_settings/.alias_settings.sh ~/.alias_settings.sh
grep -qxF 'source ~/.alias_settings.sh' ~/.bashrc || printf '\n%s\n' 'source ~/.alias_settings.sh' >> ~/.bashrc
source ~/.bashrc
```

이미 복제한 폴더가 있다면 다시 clone하지 않고 해당 폴더에서 `git fetch origin`, `git switch jazzy`, `git pull --ff-only origin jazzy`를 실행하세요. Humble 환경은 `jazzy` 대신 `humble`을 선택하세요.

## 주요 기능

- `cb` — ROS 2 워크스페이스 빌드
- `srws` — 현재 워크스페이스의 설치 환경 활성화
- `sb` — Bash 설정 재적용
- `humble`, `jazzy` — 해당 ROS 2 환경 활성화
- `cisaac`, `isaac` — Jazzy 브랜치의 선택적 Isaac Sim 실행 기능

> ROS 2, colcon은 별도로 설치해야 합니다. Jazzy 설정의 CycloneDDS는 `ros-jazzy-rmw-cyclonedds-cpp` 패키지가 필요합니다. Conda/Isaac Sim을 사용하지 않는다면 해당 명령을 실행할 필요는 없습니다.

