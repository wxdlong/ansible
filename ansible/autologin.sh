#!/usr/bin/expect
 

if {${argc} < 4} {
         puts "Usage: cmd <host> <username> <password>"
         exit 1
 }

set host [lindex ${argv} 0]
set username [lindex ${argv} 1]
set password [lindex ${argv} 2]
set port [lindex ${argv} 3]

spawn ssh-copy-id  ${username}@${host}

expect {
    "*password:" {
        send "${password}\r"
        exp_continue
        }

    "Are you sure you want to continue connecting" {
        send "yes\r"
        exp_continue 
        }

    "*]#" {
        send "exit\r" 
        }

} 
 
