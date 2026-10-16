#!/usr/bin/env bash
# Ubuntu 22.04 / ROS 2 Humble (Bash)

alias humble='source /opt/ros/humble/setup.bash'
alias cb='colcon build --symlink-install'

srws() {
    if [[ ! -f install/setup.bash ]]; then
        printf '%s\n' 'install/setup.bash가 없습니다. 워크스페이스 루트에서 실행하세요.' >&2
        return 1
    fi
    source install/setup.bash
}

alias sb='source ~/.bashrc'
