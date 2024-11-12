export XMODIFIERS="@im=fcitx"
export QT_IM_MODULE=<module>
export GTK_IM_MODULE=<module>
eval "$(dbus-launch --sh-syntax --exit-with-session)"
x0vncserver -PasswordFile ~/.config/tigervnc/passwd
exec mate-session
