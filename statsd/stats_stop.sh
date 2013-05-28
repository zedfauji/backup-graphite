kill -n 9 $(ps -elf|grep stats|grep -v grep|awk '{print $4}')

