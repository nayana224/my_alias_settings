#!/usr/bin/env bash
# Ubuntu 24.04 / ROS 2 Jazzy
# ~/.alias_settings.sh 에 복사한 후 ~/.bashrc에서 source 하세요.

# ROS 2: 필요할 때 명시적으로 활성화합니다.
alias jazzy='source /opt/ros/jazzy/setup.bash'
alias cb='colcon build --symlink-install'
srws() {
    if [[ ! -f install/setup.bash ]]; then
        echo "install/setup.bash 파일이 없습니다. ROS 2 워크스페이스에서 실행하세요." >&2
        return 1
    fi
    source install/setup.bash
}

# CycloneDDS를 사용하는 경우 패키지를 별도로 설치해야 합니다.
export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp

# Isaac Sim (conda 환경 isaacsim이 설치되어 있어야 합니다.)
alias cisaac='conda activate isaacsim'
isaac() (
    source /opt/ros/jazzy/setup.bash || exit 1
    conda activate isaacsim || exit 1
    command isaacsim "$@"
)

# Bash
alias sb='source ~/.bashrc'
