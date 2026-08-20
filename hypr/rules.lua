-- See https://wiki.hyprland.org/Configuring/Window-Rules


-- Floating windows
hl.window_rule({
    match = { class = "org.gnome.Loupe" };
    float = true;
});
hl.window_rule({
    match = { class = "mcpelauncher-webview" };
    float = true;
});
hl.window_rule({
    match = { class = "org.gnome.Calculator" };
    float = true;
});
hl.window_rule({
    match = { class = "org.gnome.NautilusPreviewer" };
    float = true;
});

hl.window_rule({
    name = "fix-android-studio-welcome";
    match = {
        class = "jetbrains-studio";
        title = "^([Ww]elcome.*)$";
    };

    float = true;
    center = true;
});

hl.window_rule({
    name = "fix-bigpicture-fs";
    match = {
        class = "steam";
        title = "^([Ss]team.*[Bb]ig [Pp]icture)";
    };

    fullscreen = 1;
});

-- Workspace
hl.window_rule({
    match = { class = "^(org.pulseaudio.pavucontrol|valent)$" };
    workspace = "e";
});
hl.window_rule({
    match = { class = "^((dev\\.vencord\\.)?[vV]esktop|(com\\.discordapp\\.)?[dD]iscord)$" };
    workspace = "special:chat";
});
hl.window_rule({
    match = { class = "^(io(.bassi|.github)(.Amberol|.retrozinndev.Vibe|.htkhiem.Euphonica))$" };
    workspace = "special:sound";
});

-- Games / Launchers
hl.window_rule({
    name = "disable-decoration-steam-apps";
    match = { class = "^steam_app.*$" };

    no_dim = true;
    no_blur = true;
    render_unfocused = true; -- avoid game crash when focusing on other apps
});
hl.window_rule({
    name = "fix-steam-popups";
    match = {
        class = "steam";
        title = "^()$";
    };

    stay_focused = true;
    no_blur = true;
    opaque = true;
    min_size = { 1, 1 };
});
hl.window_rule({
    name = "center-floating-apps";
    match = {
        class = "^(moe\\.launcher\\..*|org.gnome.Nautilus|com.github.rafostar.Clapper|io.mrarm.mcpelauncher-ui-qt|net.nokyan.Resources|org.gnome.TextEditor|nm-connection-editor|org.pulseaudio.pavucontrol|io.github.kaii_lb.Overskride|xdg-desktop-portal(-gtk)?|io.bassi.Amberol|warp-taskbar|org.gnome.seahorse.Application|com.saivert.pwvucontrol)$";
    };

    float = true;
    animation = "gnomed";
    size = { 1280, 720 };
    center = true;
});

-- Opacity
hl.window_rule({
    match = { class = "kitty" };
    opacity = "0.95 0.95";
});
hl.window_rule({
    match = { class = "io.bassi.Amberol" };
    opacity = "0.92 0.92";
});
hl.window_rule({
    name = "vibe-player-opacity";
    match = {
        class = "gjs|io.github.retrozinndev.Vibe";
        title = "^(Vibe|.*Vibe)$";
    };

    opacity = "0.92 0.92";
});
hl.window_rule({
    match = { class = "spotify" };
    opacity = "0.88 0.88";
});
hl.window_rule({
    match = { class = "hyprpolkitagent" };
    opacity = "0.88 0.88";
});
hl.window_rule({
    match = { class = "ibus-ui" };
    no_focus = true;
});

-- PiP (Picture-in-picture)
hl.window_rule({
    name = "fix-pip";
    match = { title = "^([Pp]icture([- ])?in([- ])?[Pp]icture)$" };

    pin = true;
    float = true;
    decorate = true;
});

-- Others
hl.window_rule({
    name = "fix-chromium-xwayland-popup-blur";
    match = { class = "^()$", title = "^()$" };

    no_blur = true;
});
hl.window_rule({ match = { class = "^(org.kde.kdeconnect..*)$" }, no_blur = true });
hl.window_rule({ match = { class = ".*" }, suppress_event = "maximize" });

hl.window_rule({
    name = "fix-anydesk-text-entry";
    match = { class = "Anydesk", title = "anydesk" };

    no_initial_focus = true;
});
hl.window_rule({
    name = "fix-krita";
    match = { class = "^(org\\.kde\\.)?[Kk]rita$" };

    no_initial_focus = true;
});

hl.layer_rule({
    name = "hyprpaper-transition";
    match = { namespace = "hyprpaper" };

    animation = "popin 60%";
});
