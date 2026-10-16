# my_alias_settings

Ubuntu 및 ROS 2 환경에서 반복 사용하는 Bash 명령어를 간단하게 실행하는 alias 설정 모음입니다.

## 사용할 환경 선택

| 브랜치 | Ubuntu | ROS 2 | 안내 |
| --- | --- | --- | --- |
| [humble](https://github.com/nayana224/my_alias_settings/tree/humble) | 22.04 LTS | Humble | [설치 및 사용법](https://github.com/nayana224/my_alias_settings/blob/humble/README.md) |
| [jazzy](https://github.com/nayana224/my_alias_settings/tree/jazzy) | 24.04 LTS | Jazzy | [설치 및 사용법](https://github.com/nayana224/my_alias_settings/blob/jazzy/README.md) |

각 브랜치에는 해당 환경용 `.alias_settings.sh`와 단계별 설치 README가 있습니다.

## 빠른 설치

자신이 사용하는 ROS 2 배포판에 맞는 브랜치를 선택하세요. 예시는 Jazzy입니다.

```bash
cd ~
git clone -b jazzy https://github.com/nayana224/my_alias_settings.git
touch ~/.alias_settings.sh
cp -a ~/.alias_settings.sh ~/.alias_settings.sh.backup
cp ~/my_alias_settings/.alias_settings.sh ~/.alias_settings.sh
grep -qxF 'source ~/.alias_settings.sh' ~/.bashrc || echo 'source ~/.alias_settings.sh' >> ~/.bashrc
source ~/.bashrc
```

Humble 환경이라면 `-b jazzy`를 `-b humble`로 변경하세요.

> 기존 `~/.alias_settings.sh`가 있다면 복사 전에 반드시 백업하세요. `cp`는 기존 파일을 덮어씁니다.

## 주요 명령어

| 명령 | 설명 |
| --- | --- |
| `cb` | ROS 2 워크스페이스 빌드 |
| `srws` | 현재 워크스페이스의 setup 파일 적용 |
| `sb` | Bash 설정 다시 불러오기 |
| `jazzy` / `humble` | 해당 ROS 2 환경 활성화 |
| `cisaac`, `isaac` | Jazzy 브랜치에서 Isaac Sim 환경 활성화 및 실행 |

설치 후 `type cb`, `type srws`로 명령어가 등록되었는지 확인할 수 있습니다.

### 자세한 설치·갱신·제거 안내

- [ROS 2 Humble 설치 안내](https://github.com/nayana224/my_alias_settings/blob/humble/README.md)
- [ROS 2 Jazzy 설치 안내](https://github.com/nayana224/my_alias_settings/blob/jazzy/README.md)
