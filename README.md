# my_alias_settings

Ubuntu 22.04 + ROS 2 Humble 개발환경에서 사용하는 bash alias, Conda, Isaac Sim, 프롬프트 설정을 모아둔 개인 shell configuration 저장소입니다.

---

## 📁 구성 파일

| 파일 | 설명 |
| --- | --- |
| `.alias_settings.sh` | bash alias, ROS 2 Humble, colcon, Conda, 프롬프트, Isaac Sim 및 개인 도구 설정 |

---

## ⚙️ 주요 기능

### 🔄 Bash reload

```bash
sb
```

`~/.bashrc`를 다시 불러옵니다.

### 🤖 ROS 2 Humble

터미널에서 설정 파일을 불러올 때 `/opt/ros/humble/setup.bash`가 존재하면 자동으로 source합니다.

ROS domain ID를 `7`로 설정하려면:

```bash
ros_domain
```

ROS 2 workspace의 루트에서 `install/setup.bash`를 source하려면:

```bash
srws
```

### 🛠️ Colcon build

전체 빌드:

```bash
cb
```

특정 패키지만 빌드:

```bash
cbp <package_name>
```

예시:

```bash
cbp my_robot_description
```

### 🐍 Conda

기본 설치 위치를 다음 경로로 가정합니다.

```text
~/miniconda3
```

`conda.sh`가 존재하면 자동으로 source합니다.

### 🖥️ Prompt

현재 Conda environment와 `ROS_DOMAIN_ID`를 프롬프트에 표시합니다.

예시:

```text
(isaacsim_5) (ID: 7)kitech:~/workspace$
```

Conda environment 또는 `ROS_DOMAIN_ID`가 변경되면 다음 프롬프트부터 현재 값을 반영합니다.

### 🚀 Isaac Sim 5.0

Isaac Sim pip environment 관련 alias:

```bash
act_isaac
isaacsim5
isaacsim5_vscode
isaac_py
```

Custom Food 프로젝트 실행:

```bash
run_custom_food_isaac
```

이 함수는 다음 프로젝트 경로를 사용합니다.

```text
~/inpyo_ws/custom_food_ws_v2
```

필요하면 `isaacsim_5` Conda environment를 활성화한 뒤 다음 모듈을 실행합니다.

```bash
python -m isaac_sim.app.main
```

### 🔧 개인 도구

Arena SDK 실행:

```bash
arena_lucid
```

Scepter GUI 실행:

```bash
scepter
```

---

## 🚀 설치 방법

1. 저장소 clone

```bash
git clone https://github.com/nayana224/my_alias_settings.git ~/my_alias_settings
```

2. `~/.bashrc`에 추가

```bash
source ~/my_alias_settings/.alias_settings.sh
```

3. 적용

```bash
source ~/.bashrc
```

정상적으로 적용되면 다음 메시지가 출력됩니다.

```text
Using the Lee In-pyo ~/.alias_settings.sh configuration.
```

---

## 🧩 권장 사용 환경

- Ubuntu 22.04 LTS
- bash
- ROS 2 Humble
- colcon
- Miniconda (`~/miniconda3`)
- Isaac Sim 5.0 pip environment (`isaacsim_5`)

일부 alias와 함수는 개인 프로젝트 및 도구 경로를 사용하므로 다른 시스템에서는 경로 수정이 필요할 수 있습니다.

---

## 📝 목적

이 저장소는 공개 배포용 shell framework보다는 개인 개발환경을 빠르게 복구하고 일관되게 유지하기 위한 용도로 관리합니다.
