-- Wiki: https://wiki.hyprland.org/Configuring/Keywords/#executing

---@type boolean
local use_uwsm = true;

---@type table<string>
local autostart = {
    "systemctl start --user hyprpolkitagent";
    "systemctl start --user gnome-keyring-daemon";
    "systemctl start --user hyprpaper";
    "systemctl start --user hyprsunset";
    "colorshell";
    "fcitx5";
    "wl-paste --type text --watch cliphist store";
    "wl-paste --type image --watch cliphist store";
};


hl.on("hyprland.start", function ()
    for _, cmd in ipairs(autostart) do
        hl.exec_cmd(
            ((use_uwsm and not string.match(cmd, "^systemctl")) and
                "uwsm-app -- "
            or "") .. cmd
        );
    end

    if use_uwsm then
        return;
    end

    -- support xdg autostart (no uwsm)
    local dirs = {
        os.getenv("XDG_CONFIG_HOME") .. "/autostart",
        "/etc/xdg/autostart"
    };

    for _, dir in ipairs(dirs) do
        hl.exec_cmd("bash -c 'for entry in `find \"" .. dir .. "\" -type f -name \"*.desktop\"`; do gio launch $entry; done'");
    end
end);
