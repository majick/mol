#define screen_id_emerald_grove_environs 4

.local
screen_data:
screen_background:
.asciz "~~~ ~~~~~~~~~~~~~~~~"
.asciz "~                  ~"
.asciz "~                  ~"
.asciz "                   ~"
.asciz "~                  ~"
.asciz "~                  ~"
.asciz "~                  ~"
.asciz "~~~~~~~~~~~~~ ~~~~~~"
screen_title: .asciz "EmeraldGroveEnvirons"
screen_start_x: .db 14 ; 1-indexed since it's screen coordinates!
screen_start_y: .db 7
screen_interactables:
    DEFINE_INTERACTABLE to_crash_site, in_door, $01, 8, 14
    DEFINE_INTERACTABLE to_wilderness, in_door, $01, 4, 1
    DEFINE_INTERACTABLE to_grove, in_door, $01, 1, 4
    DEFINE_INTERACTABLE blank_4, 0, 0, 0, 0
    DEFINE_INTERACTABLE blank_5, 0, 0, 0, 0
    DEFINE_INTERACTABLE blank_6, 0, 0, 0, 0
    DEFINE_INTERACTABLE blank_7, 0, 0, 0, 0
    DEFINE_INTERACTABLE blank_8, 0, 0, 0, 0
    DEFINE_INTERACTABLE blank_9, 0, 0, 0, 0
    DEFINE_INTERACTABLE blank_10, 0, 0, 0, 0
screen_get_interaction_prompt: .dw get_interaction_prompt
screen_interact_callback: .dw on_interact

emerald_grove_environs::
    ld hl, player_party
    ld a, (party_size)
    ld bc, screen_data
    call exploration_ui

    ret

get_interaction_prompt:
    ld hl, empty_prompt
    ret

on_interact:
    cp a, 0
    jp z,  exit_to_crash_site

    cp a, 1
    jp z, exit_to_wilderness

    cp a, 2
    jp z, exit_to_grove

    ret

exit_to_wilderness:
    ld a, ec_door
    ld b, screen_id_wilderness
    call set_screen_exit_conditions
    ld a, 1
    ret

exit_to_crash_site:
    ld a, ec_door
    ld b, screen_id_crash_site
    call set_screen_exit_conditions
    ld a, 1
    ret

exit_to_grove:
    ld a, ec_door
    ld b, screen_id_emerald_grove
    call set_screen_exit_conditions
    ld a, 1
    ret

.endlocal
