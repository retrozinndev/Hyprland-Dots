-- Wiki: https://wiki.hyprland.org/Configuring/Variables

hl.config {
    general = {
        gaps_in = 6;
        gaps_out = 12;

        border_size = 2;
        resize_on_border = false;

        allow_tearing = false;

        ["col.active_border"] = "#e6d47b";
        ["col.inactive_border"] = "#000000";
    };

    decoration = {
        rounding = 18;
        rounding_power = 2.1;

        active_opacity = 1.0;
        inactive_opacity = 0.95;

        shadow = {
            enabled = true;
            range = 5;
            render_power = 8;
        };

        blur = {
            enabled = true;
            new_optimizations = true;

            size = 0;
            passes = 6;
            vibrancy = 6;
            popups = false;
        };
    };

    render = {
        ctm_animation = true;
    };

    misc = {
        animate_manual_resizes = true;
    };

    animations = {
        enabled = true;
        workspace_wraparound = false;
    };
};
