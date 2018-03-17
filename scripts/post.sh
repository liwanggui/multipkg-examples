#!/bin/bash

username=www

if ! id $username &>/dev/null; then
    useradd -M -s /sbin/login www
fi
