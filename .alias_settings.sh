#!/usr/bin/env bash
# Ubuntu 24.04 / ROS 2 Jazzy (Bash)

alias jazzy='source /opt/ros/jazzy/setup.bash'
alias cb='colcon build --symlink-install'

srws() {
    if [[ ! -f install/setup.bash ]]; then
        printf '%s\n' 'install/setup.bash가 없습니다. 워크스페이스 루트에서 실행하세요.' >&2
        return 1
    fi
    source install/setup.bash
}

# CycloneDDS 사용: ros-jazzy-rmw-cyclonedds-cpp 설치 필요
export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp

# Conda의 shell hook이 ~/.bashrc에서 먼저 초기화되어 있어야 합니다.
alias cisaac='conda activate isaacsim'
isaac() (
    source /opt/ros/jazzy/setup.bash || exit 1
    conda activate isaacsim || exit 1
    command isaacsim "$@"
)

alias sb='source ~/.bashrc'
