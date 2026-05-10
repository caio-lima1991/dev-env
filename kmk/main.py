import board

from kmk.kmk_keyboard import KMKKeyboard
from kmk.keys import KC, Key
from kmk.scanners import DiodeOrientation
from kmk.modules.layers import Layers
from kmk.modules.mouse_keys import MouseKeys
from kmk.extensions.media_keys import MediaKeys
from kmk.modules.mouse_jiggler import MouseJiggler

keyboard = KMKKeyboard()
keyboard.modules.append(Layers())
keyboard.extensions.append(MediaKeys())

keyboard.modules.append(MouseJiggler())

mouse_keys = MouseKeys(
    max_speed = 20,
    acc_interval = 20,
    move_step = 1)

keyboard.modules.append(mouse_keys)

def toggle_mouse_speed(key, keyboard, *args):
    if mouse_keys.max_speed == 20:
        mouse_keys.max_speed = 5
    else:
        mouse_keys.max_speed = 20

KC_MS_SPD = Key(on_press=toggle_mouse_speed)

keyboard.row_pins = (board.GP0, board.GP1, board.GP2, board.GP3, board.GP4)
keyboard.col_pins = (board.GP5, board.GP6, board.GP7, board.GP8, board.GP9, 
                     board.GP10, board.GP11, board.GP12, board.GP13, board.GP14, 
                     board.GP20, board.GP21)
keyboard.coord_mapping = [
        1,  2,  0,  3,  4,  5,   6,  7,  8,  9,  11, 10,
        13, 14, 12, 15, 16, 17,  18, 19, 20, 21, 23, 22,
        25, 26, 24, 27, 28, 29,  30, 31, 32, 33, 35, 34,
        37, 38, 36, 39, 40, 41,  42, 43, 44, 45, 47, 46,
                48, 51, 52, 53,  54, 55, 56, 57
    ]
keyboard.diode_orientation = DiodeOrientation.COL2ROW

# Definições de Camadas
BASE = 0
SYMB = 1
NAVI = 2

keyboard.keymap = [
    # LAYER 0: BASE
    [
        KC.ESC,     KC.N1,    KC.N2,    KC.N3,    KC.N4,    KC.N5,                      KC.N6,    KC.N7,    KC.N8,    KC.N9,    KC.N0,    KC.BSPC,
        KC.TAB,     KC.Q,     KC.W,     KC.E,     KC.R,     KC.T,                       KC.Y,     KC.U,     KC.I,     KC.O,     KC.P,     KC.DEL,
        KC.LALT,    KC.A,     KC.S,     KC.D,     KC.F,     KC.G,                       KC.H,     KC.J,     KC.K,     KC.L,     KC.SCLN,  KC.QUOT,
        KC.LSFT,    KC.Z,     KC.X,     KC.C,     KC.V,     KC.B,                       KC.N,     KC.M,     KC.COMM,  KC.DOT,   KC.SLSH,  KC.RSFT,
                              KC.LCTL,  KC.ENT,   KC.MO(1), KC.LGUI,                    KC.RGUI,  KC.MO(2), KC.SPC,   KC.RALT
    ],

    # LAYER 1: SYMBOLS & NUMPAD
    [
        KC.TRNS,    KC.EXLM,  KC.AT,    KC.HASH,  KC.DLR,   KC.PERC,                    KC.CIRC,  KC.AMPR,  KC.ASTR,  KC.LPRN,  KC.RPRN,  KC.TRNS,
        KC.TRNS,    KC.NO,    KC.NO,    KC.LBRC,  KC.RBRC,  KC.PIPE,                    KC.PLUS,  KC.N7,    KC.N8,    KC.N9,    KC.ASTR,  KC.TRNS,
        KC.TRNS,    KC.NO,    KC.GRAVE, KC.LCBR,  KC.RCBR,  KC.BSLS,                    KC.MINS,  KC.N4,    KC.N5,    KC.N6,    KC.SLASH, KC.TRNS,
        KC.TRNS,    KC.NO,    KC.NO,    KC.LPRN,  KC.RPRN,  KC.EQL,                     KC.UNDS,  KC.N1,    KC.N2,    KC.N3,    KC.ENT,   KC.TRNS,
                              KC.TRNS,  KC.TRNS,  KC.LGUI,  KC.NO,                      KC.TRNS,  KC.TRNS,  KC.N0,    KC.TRNS
    ],

    # LAYER 2: NAVI, MOUSE & MEDIA
    [
        KC.F12,     KC.F1,    KC.F2,    KC.F3,    KC.F4,    KC.F5,                      KC.F6,    KC.F7,    KC.F8,    KC.F9,    KC.F10,   KC.F11,
        KC.TRNS,    KC_MS_SPD,KC.MB_LMB,KC.MS_UP, KC.MB_RMB,KC.PGUP,                    KC.NO,    KC.HOME,  KC.UP,    KC.END,   KC.INS,   KC.TRNS,
        KC.TRNS,    KC.NO,    KC.MS_LT, KC.MS_DN, KC.MS_RT, KC.PGDN,                    KC.NO,    KC.LEFT,  KC.DOWN,  KC.RGHT,  KC.CAPS,  KC.TRNS,
        KC.TRNS,    KC.MUTE,  KC.VOLD,  KC.VOLU,  KC.MPLY,  KC.MNXT,                    KC.MUTE,  KC.VOLD,  KC.VOLU,  KC.MPLY,  KC.MNXT,  KC.TRNS,
                              KC.LCTL,  KC.ENT,   KC.TRNS,  KC.TRNS,                    KC.TRNS,  KC.TRNS,  KC.TRNS,  KC.TRNS
    ]
]

if __name__ == '__main__':
    keyboard.go()
