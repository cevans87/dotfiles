#!/bin/env bash

set -e

U="${1-$(whoami)}"
H="${2-$(hostname)}"

# shellcheck disable=SC2206
TS=( default $U $H )

# docker
case "$H" in barovia | waterdeep) TS+=("docker") ;; esac

# docker_cli
case "$U" in modulo) TS+=("docker_cli") ;; esac

# docker_daemon
case "$H" in barovia | waterdeep) TS+=("docker_daemon") ;; esac

# python3_12
case "$U" in atools | modulo) TS+=("python3_12") ;; esac

# rig
case "$H" in barovia | waterdeep) TS+=("rig") ;; esac

# rust
case "$U" in modulo) TS+=("rust") ;; esac

# sway
case "$H" in barovia | waterdeep) TS+=("sway") ;; esac

# vim
case "$U" in modulo) ;; esac

if [ -n "${TS[*]}" ] ; then
    echo "$(IFS="${3-$'\n'}"; echo "${TS[*]}")"
fi
