# ============================================================
# ~/.alias_settings.sh
# Personal shell configuration
# ============================================================

# ------------------------------------------------------------
# 00. System info
# ------------------------------------------------------------

alias nf='neofetch'

# ------------------------------------------------------------
# 01. Bash reload
# ------------------------------------------------------------

alias sb='source ~/.bashrc && echo "bashrc is reloaded"'

# ------------------------------------------------------------
# 02. ROS 2 Humble setup
# ------------------------------------------------------------

if [ -f /opt/ros/humble/setup.bash ]; then
    source /opt/ros/humble/setup.bash
fi

alias ros_domain='export ROS_DOMAIN_ID=7; echo "ROS_DOMAIN_ID is set to 7 !"'

alias cb='colcon build --symlink-install --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=ON'
alias cbp='colcon build --symlink-install --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=ON --packages-select'

# colcon build 자동완성
if [ -f /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash ]; then
    source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash
fi

# ------------------------------------------------------------
# 03. ROS workspace source helper
# ------------------------------------------------------------

srws() {
    if [ -f install/setup.bash ]; then
        source install/setup.bash
        echo "'source install/setup.bash' is completed"
    else
        echo "install/setup.bash not found. Are you in a ROS 2 workspace?"
        return 1
    fi
}

# ------------------------------------------------------------
# 04. Conda setup
# ------------------------------------------------------------

CONDA_SETUP="$HOME/miniconda3/etc/profile.d/conda.sh"

if [ -f "$CONDA_SETUP" ]; then
    source "$CONDA_SETUP"
fi

# ------------------------------------------------------------
# 05. Prompt style
# Example: (isaacsim_5) (ID: 7)kitech:~/workspace$
# ------------------------------------------------------------

GREEN='\[\e[1;32m\]'
BLUE='\[\e[1;34m\]'
YELLOW='\[\e[1;33m\]'
NC='\[\e[0m\]'

__conda_prompt() {
    if [ -n "$CONDA_DEFAULT_ENV" ]; then
        printf '(%s) ' "$CONDA_DEFAULT_ENV"
    fi
}

# 작은따옴표로 보관해 현재 Conda 환경과 ROS_DOMAIN_ID를 매 프롬프트마다 반영한다.
PS1='${YELLOW}$(__conda_prompt)${BLUE}(ID: ${ROS_DOMAIN_ID:-0})${GREEN}\u${NC}:${BLUE}\w${NC}\$ '

# ------------------------------------------------------------
# 06. Library path cleanup
# ------------------------------------------------------------

# 이전 로컬 Isaac Sim 경로를 제거해 pip 환경과의 라이브러리 충돌을 피한다.
if [ -n "$LD_LIBRARY_PATH" ]; then
    export LD_LIBRARY_PATH="$({
        printf '%s' "$LD_LIBRARY_PATH" \
            | tr ':' '\n' \
            | grep -v 'isaac-sim' \
            | paste -sd ':' -
    })"
fi

# ------------------------------------------------------------
# 07. Isaac Sim 5.0 pip environment
# ------------------------------------------------------------

alias act_isaac='conda activate isaacsim_5'
alias isaacsim5='conda activate isaacsim_5 && isaacsim'
alias isaacsim5_vscode='conda activate isaacsim_5 && isaacsim --enable isaacsim.code_editor.vscode'
alias isaac_py='conda activate isaacsim_5 && python'

# ------------------------------------------------------------
# 08. Custom Food Isaac Sim 5.0
# ------------------------------------------------------------

run_custom_food_isaac() {
    cd "$HOME/inpyo_ws/custom_food_ws_v2" || return 1

    if [[ "$CONDA_DEFAULT_ENV" != "isaacsim_5" ]]; then
        conda activate isaacsim_5 || return 1
    fi

    python -m isaac_sim.app.main
}

# ------------------------------------------------------------
# 09. Tools
# ------------------------------------------------------------

alias arena_lucid="$HOME/inpyo_tool/ArenaSDK_Linux_Lucid/OutputDirectory/Linux/x64Release/avmp_run.sh"

scepter() {
    cd "$HOME/inpyo_tool/ScepterGUItool_ds87/Ubuntu" || return 1
    ./ScepterGUITool
}

# ------------------------------------------------------------
# 10. Personal check
# ------------------------------------------------------------

alias inpyo='echo "Using the Lee In-pyo ~/.alias_settings.sh configuration."'

inpyo
