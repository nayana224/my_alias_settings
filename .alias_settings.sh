#!/usr/bin/env bash
# Ubuntu 22.04 / ROS 2 Humble
# ~/.alias_settings.sh 에 복사한 후 ~/.bashrc에서 source 하세요.

alias humble='source /opt/ros/humble/setup.bash'
alias cb='colcon build --symlink-install'
srws() {
    if [[ ! -f install/setup.bash ]]; then
        echo "install/setup.bash 파일이 없습니다. ROS 2 워크스페이스에서 실행하세요." >&2
        return 1
    fi
    source install/setup.bash
}

# 필요한 경우 ROS_DOMAIN_ID나 RMW_IMPLEMENTATION을 직접 설정하세요.
# export ROS_DOMAIN_ID=7
# export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp

# Bash
alias sb='source ~/.bashrc'
