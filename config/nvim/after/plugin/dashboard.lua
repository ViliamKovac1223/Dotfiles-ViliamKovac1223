vim.g.dashboard_default_executive = 'telescope'

local dashboard = require('dashboard');

local function getHeader()
    local DOOM_INDEX = 3;
    local headers = {
        { -- 01
            '',
            '    ⢰⣧⣼⣯⠄⣸⣠⣶⣶⣦⣾⠄⠄⠄⠄⡀⠄⢀⣿⣿⠄⠄⠄⢸⡇⠄⠄ ',
            '    ⣾⣿⠿⠿⠶⠿⢿⣿⣿⣿⣿⣦⣤⣄⢀⡅⢠⣾⣛⡉⠄⠄⠄⠸⢀⣿⠄ ',
            '   ⢀⡋⣡⣴⣶⣶⡀⠄⠄⠙⢿⣿⣿⣿⣿⣿⣴⣿⣿⣿⢃⣤⣄⣀⣥⣿⣿⠄ ',
            '   ⢸⣇⠻⣿⣿⣿⣧⣀⢀⣠⡌⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⣿⣿⣿⠄ ',
            '  ⢀⢸⣿⣷⣤⣤⣤⣬⣙⣛⢿⣿⣿⣿⣿⣿⣿⡿⣿⣿⡍⠄⠄⢀⣤⣄⠉⠋⣰ ',
            '  ⣼⣖⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⢇⣿⣿⡷⠶⠶⢿⣿⣿⠇⢀⣤ ',
            ' ⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣷⣶⣥⣴⣿⡗ ',
            ' ⢀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟  ',
            ' ⢸⣿⣦⣌⣛⣻⣿⣿⣧⠙⠛⠛⡭⠅⠒⠦⠭⣭⡻⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃  ',
            ' ⠘⣿⣿⣿⣿⣿⣿⣿⣿⡆⠄⠄⠄⠄⠄⠄⠄⠄⠹⠈⢋⣽⣿⣿⣿⣿⣵⣾⠃  ',
            '  ⠘⣿⣿⣿⣿⣿⣿⣿⣿⠄⣴⣿⣶⣄⠄⣴⣶⠄⢀⣾⣿⣿⣿⣿⣿⣿⠃   ',
            '   ⠈⠻⣿⣿⣿⣿⣿⣿⡄⢻⣿⣿⣿⠄⣿⣿⡀⣾⣿⣿⣿⣿⣛⠛⠁    ',
            '     ⠈⠛⢿⣿⣿⣿⠁⠞⢿⣿⣿⡄⢿⣿⡇⣸⣿⣿⠿⠛⠁      ',
            '        ⠉⠻⣿⣿⣾⣦⡙⠻⣷⣾⣿⠃⠿⠋⠁     ⢀⣠⣴ ',
            ' ⣿⣿⣿⣶⣶⣮⣥⣒⠲⢮⣝⡿⣿⣿⡆⣿⡿⠃⠄⠄⠄⠄⠄⠄⠄⣠⣴⣿⣿⣿ ',
            '',
        },
        { -- 02
            "",
            "",
            " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
            " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
            " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
            " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
            " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
            " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
            "",
            "",
        },
        { -- 03
            "",
            "=================     ===============     ===============   ========  ========",
            "\\\\ . . . . . . .\\\\   //. . . . . . .\\\\   //. . . . . . .\\\\  \\\\. . .\\\\// . . //",
            "||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\\/ . . .|,",
            "|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . |,",
            "||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .|,",
            "|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\\ . . . . ||",
            "||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\\_ . .|. .||",
            "|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\\ `-_/| . ||",
            "||_-' ||  .|/    || ||    \\|.  || `-_|| ||_-' ||  .|/    || ||   | \\  / |-_.||",
            "||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \\  / |  `||",
            "||    `'         || ||         `'    || ||    `'         || ||   | \\  / |   ||",
            "||            .===' `===.         .==='.`===.         .===' /==. |  \\/  |   ||",
            "||         .=='   \\_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \\/  |   ||",
            "||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \\/  |   ||",
            "||   .=='    _-'          '-__\\._-'         '-_./__-'         `' |. /|  |   ||",
            "||.=='    _-'                                                     `' |  /==.||",
            "=='    _-'                        N E O V I M                         \\/   `==",
            "\\   _-'                                                                `-_   /",
            "`''                                                                       ``,",
            "",
        },
        { -- 04
            '',
            '⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣤⣤⣴⣦⣤⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ',
            '⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⣿⠿⠿⠿⠿⣿⣿⣿⣿⣶⣤⡀⠀⠀⠀⠀⠀⠀ ',
            '⠀⠀⠀⠀⣠⣾⣿⣿⡿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢿⣿⣿⣶⡀⠀⠀⠀⠀ ',
            '⠀⠀⠀⣴⣿⣿⠟⠁⠀⠀⠀⣶⣶⣶⣶⡆⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣦⠀⠀⠀ ',
            '⠀⠀⣼⣿⣿⠋⠀⠀⠀⠀⠀⠛⠛⢻⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣧⠀⠀ ',
            '⠀⢸⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⡇⠀ ',
            '⠀⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⠀ ',
            '⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⡟⢹⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⣹⣿⣿⠀ ',
            '⠀⣿⣿⣷⠀⠀⠀⠀⠀⠀⣰⣿⣿⠏⠀⠀⢻⣿⣿⡄⠀⠀⠀⠀⠀⠀⣿⣿⡿⠀ ',
            '⠀⢸⣿⣿⡆⠀⠀⠀⠀⣴⣿⡿⠃⠀⠀⠀⠈⢿⣿⣷⣤⣤⡆⠀⠀⣰⣿⣿⠇⠀ ',
            '⠀⠀⢻⣿⣿⣄⠀⠀⠾⠿⠿⠁⠀⠀⠀⠀⠀⠘⣿⣿⡿⠿⠛⠀⣰⣿⣿⡟⠀⠀ ',
            '⠀⠀⠀⠻⣿⣿⣧⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⠏⠀⠀⠀ ',
            '⠀⠀⠀⠀⠈⠻⣿⣿⣷⣤⣄⡀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⠟⠁⠀⠀⠀⠀ ',
            '⠀⠀⠀⠀⠀⠀⠈⠛⠿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⠁⠀⠀⠀⠀⠀⠀ ',
            '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⠛⠛⠛⠛⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ',
            '',
        },
        { -- 05
            '',
            '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ',
            '⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡖⠁⠀⠀⠀⠀⠀⠀⠈⢲⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀ ',
            '⠀⠀⠀⠀⠀⠀⠀⠀⣼⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣧⠀⠀⠀⠀⠀⠀⠀⠀ ',
            '⠀⠀⠀⠀⠀⠀⠀⣸⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣇⠀⠀⠀⠀⠀⠀⠀ ',
            '⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇⠀⢀⣀⣤⣤⣤⣤⣀⡀⠀⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀ ',
            '⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣔⢿⡿⠟⠛⠛⠻⢿⡿⣢⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀ ',
            '⠀⠀⠀⠀⣀⣤⣶⣾⣿⣿⣿⣷⣤⣀⡀⢀⣀⣤⣾⣿⣿⣿⣷⣶⣤⡀⠀⠀⠀⠀ ',
            '⠀⠀⢠⣾⣿⡿⠿⠿⠿⣿⣿⣿⣿⡿⠏⠻⢿⣿⣿⣿⣿⠿⠿⠿⢿⣿⣷⡀⠀⠀ ',
            '⠀⢠⡿⠋⠁⠀⠀⢸⣿⡇⠉⠻⣿⠇⠀⠀⠸⣿⡿⠋⢰⣿⡇⠀⠀⠈⠙⢿⡄⠀ ',
            '⠀⡿⠁⠀⠀⠀⠀⠘⣿⣷⡀⠀⠰⣿⣶⣶⣿⡎⠀⢀⣾⣿⠇⠀⠀⠀⠀⠈⢿⠀ ',
            '⠀⡇⠀⠀⠀⠀⠀⠀⠹⣿⣷⣄⠀⣿⣿⣿⣿⠀⣠⣾⣿⠏⠀⠀⠀⠀⠀⠀⢸⠀ ',
            '⠀⠁⠀⠀⠀⠀⠀⠀⠀⠈⠻⢿⢇⣿⣿⣿⣿⡸⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠈⠀ ',
            '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ',
            '⠀⠀⠀⠐⢤⣀⣀⢀⣀⣠⣴⣿⣿⠿⠋⠙⠿⣿⣿⣦⣄⣀⠀⠀⣀⡠⠂⠀⠀⠀ ',
            '⠀⠀⠀⠀⠀⠈⠉⠛⠛⠛⠛⠉⠀⠀⠀⠀⠀⠈⠉⠛⠛⠛⠛⠋⠁⠀⠀⠀⠀⠀ ',
            '',
        },
        { -- 06
            '',
            '         ▀████▀▄▄              ▄█ ',
            '           █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ',
            '    ▄       █          ▀▀▀▀▄  ▄▀  ',
            '   ▄▀▀▄      ▀▄              ▀▄▀  ',
            '  ▄▀   █     █▀   ▄█▀▄      ▄█    ',
            '  ▀▄    ▀▄  █     ▀██▀     ██▄█   ',
            '   ▀▄   ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ',
            '    █ ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ',
            '   █  █  █      ▄▄           ▄▀   ',
            '',
        },
        { -- 07
            '',
            '               ▄▄██████████▄▄             ',
            '               ▀▀▀   ██   ▀▀▀             ',
            '       ▄██▄   ▄▄████████████▄▄   ▄██▄     ',
            '     ▄███▀  ▄████▀▀▀    ▀▀▀████▄  ▀███▄   ',
            '    ████▄ ▄███▀              ▀███▄ ▄████  ',
            '   ███▀█████▀▄████▄      ▄████▄▀█████▀███ ',
            '   ██▀  ███▀ ██████      ██████ ▀███  ▀██ ',
            '    ▀  ▄██▀  ▀████▀  ▄▄  ▀████▀  ▀██▄  ▀  ',
            '       ███           ▀▀           ███     ',
            '       ██████████████████████████████     ',
            '   ▄█  ▀██  ███   ██    ██   ███  ██▀  █▄ ',
            '   ███  ███ ███   ██    ██   ███▄███  ███ ',
            '   ▀██▄████████   ██    ██   ████████▄██▀ ',
            '    ▀███▀ ▀████   ██    ██   ████▀ ▀███▀  ',
            '     ▀███▄  ▀███████    ███████▀  ▄███▀   ',
            '       ▀███    ▀▀██████████▀▀▀   ███▀     ',
            '         ▀    ▄▄▄    ██    ▄▄▄    ▀       ',
            '               ▀████████████▀             ',
            '',
        },
        { -- 08
            '',
            '     ████               ████       ',
            '    ███                   ███      ',
            '   ███                     ███     ',
            '  ███                       ███    ',
            ' ███                         ███   ',
            '████                         ████  ',
            '████                         ████  ',
            '██████       ███████       ██████  ',
            '█████████████████████████████████  ',
            ' ███████████████████████████████   ',
            '  ████ ███████████████████ ████    ',
            '       ███▀███████████▀███         ',
            '      ████──▀███████▀──████        ',
            '      █████───█████───█████        ',
            '       ███████████████████         ',
            '        █████████████████          ',
            '         ███████████████           ',
            '          █████████████            ',
            '           ███████████             ',
            '          ███──▀▀▀──███            ',
            '          ███─█████─███            ',
            '           ███─███─███             ',
            '            █████████              ',
            '',
        },
        { -- 09
            '',
            '              ▄▄▄▄▄▄▄▄▄            ',
            '           ▄█████████████▄          ',
            '   █████  █████████████████  █████  ',
            '   ▐████▌ ▀███▄       ▄███▀ ▐████▌  ',
            '    █████▄  ▀███▄   ▄███▀  ▄█████    ',
            '    ▐██▀███▄  ▀███▄███▀  ▄███▀██▌    ',
            '     ███▄▀███▄  ▀███▀  ▄███▀▄███    ',
            '     ▐█▄▀█▄▀███ ▄ ▀ ▄ ███▀▄█▀▄█▌    ',
            '      ███▄▀█▄██ ██▄██ ██▄█▀▄███      ',
            '       ▀███▄▀██ █████ ██▀▄███▀      ',
            '      █▄ ▀█████ █████ █████▀ ▄█      ',
            '      ███        ███        ███      ',
            '      ███▄    ▄█ ███ █▄    ▄███      ',
            '      █████ ▄███ ███ ███▄ █████      ',
            '      █████ ████ ███ ████ █████      ',
            '      █████ ████▄▄▄▄▄████ █████      ',
            '       ▀███ █████████████ ███▀      ',
            '         ▀█ ███ ▄▄▄▄▄ ███ █▀        ',
            '            ▀█▌▐█████▌▐█▀            ',
            '               ███████              ',
            '',
        },
        { -- 10
            '',
            ' ███████████████████████████ ',
            ' ███████▀▀▀░░░░░░░▀▀▀███████ ',
            ' ████▀░░░░░░░░░░░░░░░░░▀████ ',
            ' ███│░░░░░░░░░░░░░░░░░░░│███ ',
            ' ██▌│░░░░░░░░░░░░░░░░░░░│▐██ ',
            ' ██░└┐░░░░░░░░░░░░░░░░░┌┘░██ ',
            ' ██░░└┐░░░░░░░░░░░░░░░┌┘░░██ ',
            ' ██░░┌┘▄▄▄▄▄░░░░░▄▄▄▄▄└┐░░██ ',
            ' ██▌░│██████▌░░░▐██████│░▐██ ',
            ' ███░│▐███▀▀░░▄░░▀▀███▌│░███ ',
            ' ██▀─┘░░░░░░░▐█▌░░░░░░░└─▀██ ',
            ' ██▄░░░▄▄▄▓░░▀█▀░░▓▄▄▄░░░▄██ ',
            ' ████▄─┘██▌░░░░░░░▐██└─▄████ ',
            ' █████░░▐█─┬┬┬┬┬┬┬─█▌░░█████ ',
            ' ████▌░░░▀┬┼┼┼┼┼┼┼┬▀░░░▐████ ',
            ' █████▄░░░└┴┴┴┴┴┴┴┘░░░▄█████ ',
            ' ███████▄░░░░░░░░░░░▄███████ ',
            ' ██████████▄▄▄▄▄▄▄██████████ ',
            '',
        },
        -- { -- 11
        --     '',
        --     '        ▄█          █          █▄          ',
        --     '      ▐██      ▄█  ███  █▄      ██▌        ',
        --     '     ▐██▌     ██████████████     ▐██▌      ',
        --     '    ████     ████████████████    ████      ',
        --     '    ▐█████  ██████████████████  █████▌     ',
        --     '    ████████████████████████████████       ',
        --     '     ███████▀▀████████████▀▀███████        ',
        --     '      █████▌  ▄▄ ▀████▀ ▄▄  ▐█████         ',
        --     '    ▄▄██████▄ ▀▀  ████  ▀▀ ▄██████▄▄       ',
        --     '    ██████████████████████████████████     ',
        --     '  ████████████████████████████████████     ',
        --     ' ██████   ███████▀▄██▄▀███████   ██████▌   ',
        --     '▐█████     ██████████████████      █████▌  ',
        --     ' ▐█████      ██████▀  ▀██████       █████▌ ',
        --     '  █████▄      ███        ███      ▄█████   ',
        --     '    ██████     █          █     ██████     ',
        --     '     █████                     █████       ',
        --     '      █████                   █████        ',
        --     '      ████   ▄            ▄    ████        ',
        --     '        ████ ██           ██ ████          ',
        --     '          ████████ ▄██▄ ████████           ',
        --     '         ████████████████████████          ',
        --     '         ████████████████████████          ',
        --     '          ▀█████████▀▀█████████▀           ',
        --     '            ▀███▀       ▀███▀              ',
        --     '',
        -- },
        { -- 12, ANSI Shadow
            '',
            '',
            '',
            '████████╗██╗  ██╗██╗███╗   ██╗██╗  ██╗██████╗  █████╗ ██████╗',
            '╚══██╔══╝██║  ██║██║████╗  ██║██║ ██╔╝██╔══██╗██╔══██╗██╔══██╗',
            '   ██║   ███████║██║██╔██╗ ██║█████╔╝ ██████╔╝███████║██║  ██║',
            '   ██║   ██╔══██║██║██║╚██╗██║██╔═██╗ ██╔═══╝ ██╔══██║██║  ██║',
            '   ██║   ██║  ██║██║██║ ╚████║██║  ██╗██║     ██║  ██║██████╔╝',
            '   ╚═╝   ╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝╚═════╝',
            '',
        },
        { -- 13, 3d
            '',
            '',
             '██████████ ██      ██          ██                            ██',
            '░░░░░██░░░ ░██     ░░          ░██     ██████                ░██',
             '   ░██    ░██      ██ ███████ ░██  ██░██░░░██  ██████       ░██',
             '   ░██    ░██████ ░██░░██░░░██░██ ██ ░██  ░██ ░░░░░░██   ██████',
             '   ░██    ░██░░░██░██ ░██  ░██░████  ░██████   ███████  ██░░░██',
             '   ░██    ░██  ░██░██ ░██  ░██░██░██ ░██░░░   ██░░░░██ ░██  ░██',
             '   ░██    ░██  ░██░██ ███  ░██░██░░██░██     ░░████████░░██████',
             '   ░░     ░░   ░░ ░░ ░░░   ░░ ░░  ░░ ░░       ░░░░░░░░  ░░░░░░ ',
            '',
        },
        { -- 14, Bloody
            '',
            '',
            '  ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓',
            '  ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒',
            ' ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░',
            ' ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██ ',
            ' ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒',
            ' ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░',
            ' ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░',
            '    ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░   ',
            '          ░    ░  ░    ░ ░        ░   ░         ░   ',
            '                                 ░                  ',
            '',
        },
    }

    local headerIndex = math.random(1, #headers);
    -- local headerIndex = 14;
    local header = headers[headerIndex];

    -- If header is "doom header" then don't include a tip line at the bottom, and just return "doom header"
    if (headerIndex == DOOM_INDEX) then
        return header;
    end

    local tips = {
        -- Vim tips
        '[ TIP: To exit Neovim, just power off your computer. ]',
        '[ In Vim, We `:wq` world ]',
        '[ Vim, Turning keyboard strokes into a martial art. ]',
        '[ Vim, It\'s not just a text editor, it\'s a lifestyle. ]',
        '[ I don\'t always code, but when I do, I code in Vim. ]',
        -- Ahri quotes
        '[ Ahri: The foxy lady who steals hearts and all your kills. ]',
        '[ Ahri, the nine-tailed fox: Turning heads and stealing hearts since ancient times. ]',
        '[ They say Ahri\'s tails hold the secrets of the universe, but she\'s really just looking for a good hair stylist. ]',
        '[ If Ahri had a penny for every heart she\'s stolen, she could buy a lifetime supply of magical essence. ]',
        '[ Ahri\'s love for collecting essence is rivaled only by her love for cute plushies. ]',
        -- '[]',
    };

    -- Add tip line at the bottom of header
    local tipIndex = math.random(1, #tips);
    -- local tipIndex = 1;
    local tip = tips[tipIndex];
    table.insert(header, tip);
    table.insert(header, ''); -- Add empty line at the end for nicer look

    return header;
end

dashboard.setup {
    -- Config
    -- theme = 'hyper', -- Default
    theme = 'doom',
    config = {
        header = getHeader(),
        center = {
            {
                icon = ' ',
                desc = 'File manager',
                desc_hl = 'String',
                key = 'f',
                keymap = 'SPC p v',
                key_hl = 'Number',
                action = 'vim.cmd.Ex'
            },
            {
                icon = '  ',
                desc = 'Old files',
                key = 'o',
                keymap = 'SPC p o',
                action = 'Telescope oldfiles'
            },
            {
                icon = '  ',
                desc = 'Find word',
                key = 'd',
                keymap = 'SPC l g',
                action = 'Telescope live_grep'
            },
            {
                icon = ' ',
                desc = 'Change color scheme',
                key = 'c',
                action = 'Telescope colorscheme'
            },

        },

        footer = {
            "",
            "[ Welcome to neovim, the only text editor you'll ever need ]",
        }
    }
}
