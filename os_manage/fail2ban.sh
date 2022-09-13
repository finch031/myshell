#!/usr/bin/env bash

fail2ban-client status sshd
#fail2ban-client set sshd banip 114.92.193.67
fail2ban-client set sshd unbanip sshd:134.122.51.33:deny
