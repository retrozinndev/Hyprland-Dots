-- Wiki: https://wiki.hyprland.org/Configuring/Keywords/#setting-the-environment

--- append a directory to the $PATH env variable
---@param path string
local function env_path_append(path)
    hl.env("PATH", os.getenv("PATH") .. ":" .. path);
end

local home = os.getenv("HOME");
local env = {
    -- Cursor
    XCURSOR_THEME = "Adwaita";
    XCURSOR_SIZE = 24;
    HYPRCURSOR_THEME = "Adwaita";
    HYPRCURSOR_SIZE = 24;

    MOZ_ENABLE_WAYLAND = 1;
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";

    -- IME
    XMODIFIERS = "@im=ibus";
    QT_IM_MODULE = "wayland";
    QT_IM_MODULES = "wayland;ibus";
    SDL_IM_MODULE = "wayland";

    GSK_RENDERER = "vulkan";

    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "kde";
    QT_AUTO_SCREEN_SCALE_FACTOR = 1;

    SSH_AUTH_SOCK = os.getenv("XDG_RUNTIME_DIR") .. "/gcr/ssh";

    JAVA_HOME = "/lib/jvm/default";

    -- XDG
    XDG_CACHE_HOME = home .. "/.cache";
    XDG_DATA_HOME = home .. "/.local/share";
    XDG_CONFIG_HOME = home .. "/.config";
};

for name, val in pairs(env) do
    hl.env(name, val);
end

env_path_append(home .. "/.local/bin");
env_path_append(home .. "/.cargo/bin");
env_path_append(home .. "/node_modules/.bin");
