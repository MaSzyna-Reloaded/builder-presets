@tool
extends Resource
class_name EraPreset
## What a world of an era is built with (the scenery importer's stage 2, its EDITOR_PLAN.md): for each
## kind of thing its description holds - a platform, a level crossing, a signal of a kind, a fence of a
## type - the game's models, textures, sizes and the parameters an era's had. The defaults are the
## contemporary railway's (the importer's own until 2026-10-17, their sources beside them); a preset of
## another era is a resource of the world assets project (world_assets/common_eras/<era>.tres)
## overriding some, picked by the world (world-packer's WorldDescription.era_preset, with its year).
##
## A model is given with what was measured of it (its length, where its origin stands): the builders
## place it by them.

## bud/blok*: past 238/256 of u is a plain column (the end wall of bud/blok_4), not facade; 2 px are
## left for the mipmaps
const BLOK_U_MAX: float = 236.0 / 256.0

@export_group("Platforms")
## The platform's surface over the rail head [m]: 0.76 on the main lines (0.55 regional, where OSM
## tags it, wins)
@export var platform_height: float = 0.76
## The game's platform paving with one edge (1024 x 4096): u along the platform, v across it - the kerb
## at v = 1, the yellow line at 0.83 - covering platform_top_along x platform_top_across metres; its v
## in the middle of a platform wider than that (paving without lines)
@export var platform_top_texture: String = "peronowe/1k_kostka1"
@export var platform_top_along: float = 1.5
@export var platform_top_across: float = 6.0
@export var platform_top_v_inner: float = 0.05
@export var platform_wall_texture: String = "beton001"
## An open roof of OSM over a platform: its slab's and its pillars' textures
@export var platform_roof_texture: String = "roof/blacha_falista"
@export var platform_pillar_texture: String = "metal/stal"
## The canopy modules over a sheltered platform without an OSM roof: one-sided (its posts by the back
## edge, its X away from the track and its roof towards it, Z along the platform, 0 .. length from its
## origin, its origin inset from the back edge - peronowe/1k96w220m_wiata_mod.inc: x 2.6, angle 0, by
## the back edge at 3.025, its kerb on -X) and two-sided (an island platform's, centred): sizes read
## from the models' vertices
@export var platform_canopy_one_sided: String = "peronowe/wiata_modernizacja_1str.t3d"
@export var platform_canopy_one_sided_length: float = 11.38
@export var platform_canopy_one_sided_inset: float = 0.425
@export var platform_canopy_two_sided: String = "peronowe/wiata_modernizacja_2str.t3d"
@export var platform_canopy_two_sided_length: float = 11.66
## The name board (3.1 m along, its X away from the track), its origin from the back edge
## (1k96w220m_wiata_mod.inc: x 2.75, angle 0, the back edge at 3.025) and half its length [m]
@export var platform_board: String = "peronowe/tablica.t3d"
@export var platform_board_inset: float = 0.275
@export var platform_board_half_length: float = 1.55

@export_group("Signals")
## Semaphores (a signal of form semaphore): a main one of one arm, of two (it shows Sr3), a distant
## disc and a shunting one (the arms are not animated by libmaszyna yet - a model standing still)
@export var semaphore_one_arm: String = "pkp/sk1krat.t3d"
@export var semaphore_two_arms: String = "pkp/sk12krat.t3d"
@export var semaphore_distant: String = "pkp/tok2_4m.t3d"
@export var semaphore_shunting: String = "pkp/tmk_4m.t3d"
## A hectometre post: the post, the kilometre's digits' plates by how many digits it has, the
## hectometre's plate, and the digits' skin (przytorowe/hekto_cyfry/<digit>)
@export var post: String = "przytorowe/slupek_hekto_nowy.t3d"
@export var post_digits: Dictionary = {1: ["przytorowe/slupek_x_1.t3d"],
        2: ["przytorowe/slupek_xx_1.t3d", "przytorowe/slupek_xx_2.t3d"],
        3: ["przytorowe/slupek_xxx_1.t3d", "przytorowe/slupek_xxx_2.t3d", "przytorowe/slupek_xxx_3.t3d"]}
@export var post_hectometre: String = "przytorowe/slupek_cyfra_hektometr.t3d"
@export var post_digit_skin: String = "przytorowe/hekto_cyfry/%d"

@export_group("Level crossings")
## The St Andrew's cross: G-3 for one track, G-4 for more; turned from the cars' heading (atan2(-dz, dx))
## by crossing_cross_turn - the model faces the other way (scenery/przejazdy/g3_1.inc: "oś oY w stronę
## toru"; at -90 the cars saw its back, stary_sacz 2026-10-14)
@export var crossing_cross_one: String = "przejazdy/g3_1.t3d"
@export var crossing_cross_more: String = "przejazdy/g4_1.t3d"
@export var crossing_cross_turn: float = 90.0
## The road signal EHZ-13 carrying the cross (crossing:light=yes), and its skin
@export var crossing_light_one: String = "przejazdy/sygnalizator_ehz13_x.t3d"
@export var crossing_light_more: String = "przejazdy/sygnalizator_ehz13_xx.t3d"
@export var crossing_light_skin: String = "przejazdy/ehz13-zadbany"
## The barrier (its arm stands up in the model: raised), lying along the road (linia053/cargo/
## przejazdy.scm: the road's angle)
@export var crossing_barrier: String = "pkp/szlab_d_60.t3d"
@export var crossing_barrier_turn: float = 0.0
## A road sign faces the cars: turned from their heading by crossing_sign_turn (l107/deko's G-1 and
## A-9, the rail signals' turn); A-9 (barriers) or A-10 on its post, the G-1a/b/c posts ahead
@export var crossing_sign_turn: float = -90.0
@export var crossing_sign_a: String = "znaki/znak_a.t3d"
@export var crossing_sign_a_barriers_skin: String = "znaki/a-9"
@export var crossing_sign_a_skin: String = "znaki/a-10"
@export var crossing_sign_g: String = "znaki/znak_g.t3d"
@export var crossing_sign_g_skins: PackedStringArray = ["znaki/g-1a", "znaki/g-1b", "znaki/g-1c"]
## CBP concrete plates (scenery/przejazdy/cbp-zzz-sws-zzz.inc, @danniel): segments of plate_length along
## the track, between the rails the end plates at the crossing's ends and the inner ones between, the
## outer ones plate_outer_offset either side of the axis (half plate_outer_half_width across,
## cbp-pz.e3d: 0.64 m), a plate plate_thickness thick from its origin up (cbp-pw.e3d), its top at the
## rail head; a plate the include turns to face the other way, by crossing_plate_turn
@export var crossing_plate_inner: String = "przejazdy/cbp-pw.t3d"
@export var crossing_plate_inner_end: String = "przejazdy/cbp-pws.t3d"
@export var crossing_plate_outer: String = "przejazdy/cbp-pz.t3d"
@export var crossing_plate_length: float = 3.0
@export var crossing_plate_outer_offset: float = 1.175
@export var crossing_plate_outer_half_width: float = 0.32
@export var crossing_plate_thickness: float = 0.18
@export var crossing_plate_turn: float = 180.0

@export_group("Tracks")
## A track's look (MaszynaTrackData's fields) by gauge, as the original sceneries have it: standard
## gauge as in libmaszyna's demo, narrow gauge as the 750 mm tracks of calkowo_v2 / slimson
@export var track_standard: Dictionary = {"material1": "rail_screw_used1", "tex_length": 6.0,
        "material2": "1435mm/tpbps-new2", "tex_height": 0.2, "tex_width": 0.5, "tex_slope": 1.1}
@export var track_narrow: Dictionary = {"material1": "rail_screw_rused2", "tex_length": 4.0,
        "material2": "tpd-old4", "tex_height": 0.2, "tex_width": 0.5, "tex_slope": 1.1}
## A switch's: its trackbed is a texture of its own (its "trackbed" attribute, Track.cpp:2378) - the
## plain track's does not map onto a switch's; tpd-stone3-used is the one the original sceneries give
## most (50 switches, e.g. calkowo_v2/v2_tory.scm, linia053/cargo/tory.scm "rail_screw_used1 4
## rail_screw_used1 0.2 2.75 2.5"); a narrow gauge one as calkowo_v2/v2_tory_750mm.scm's wsk_z01
## ("rail_screw_rused2 4 rail_screw_unused2 0.0 0.0 0.0", no trackbed of its own)
@export var switch_standard: Dictionary = {"material1": "rail_screw_used1", "tex_length": 4.0,
        "material2": "rail_screw_used1", "tex_height": 0.2, "tex_width": 2.75, "tex_slope": 2.5,
        "trackbed_material": "1435mm/tpd-stone3-used"}
@export var switch_narrow: Dictionary = {"material1": "rail_screw_rused2", "tex_length": 4.0,
        "material2": "rail_screw_unused2", "tex_height": 0.0, "tex_width": 0.0, "tex_slope": 0.0}

@export_group("Catenary")
## The contact and the support wire over the rail head [m] (linia053)
@export var catenary_contact_height: float = 5.6
@export var catenary_support_height: float = 6.6
## The models `include tr/l-stb1-3d.inc x y z angle texture end` puts (linia053/cargo/trakcja.scm,
## scenery/tr/l-stb1-3d.inc): a concrete mast and the arm by the track's axis, each its offset along
## the include's local X from its origin (on the axis, at the contact wire's height)
@export var catenary_mast: String = "tr/stb1.t3d"
@export var catenary_mast_skin: String = "tr/slup_beton1"
@export var catenary_mast_offset: float = 2.55
@export var catenary_arm: String = "tr/-3d.t3d"
@export var catenary_arm_skin: String = "tr/wys-ni-d"
@export var catenary_arm_offset: float = 0.038

@export_group("Bridges")
## A deck's slab beyond the carriageway or the formation on each side, its barriers' height and
## thickness, piers about bridge_pier_spacing apart - a wall across the deck bridge_pier_thickness
## thick - and the texture (the game's textures/) of it all with the metres one repeat covers
@export var bridge_deck_margin: float = 0.5
@export var bridge_barrier_height: float = 1.0
@export var bridge_barrier_thickness: float = 0.25
@export var bridge_pier_spacing: float = 25.0
@export var bridge_pier_thickness: float = 1.2
@export var bridge_texture: String = "beton001"
@export var bridge_texture_metres: float = 4.0

@export_group("Fences")
## A fence's segment model by its type (the description's FenceType by its name): [path, its length from
## its origin [m], the axis it runs along from it: X_NEGATIVE, Z_POSITIVE, X_CENTRED] - measured on its
## .e3d (E3DModelTool.get_aabb()), its height in the comment: chain_link 2.5 m, barbed_wire 2.45 m,
## wood/board 1.8 m, pickets 0.8 m, split_rail 1.0 m, concrete plates 1.5 m
@export var fence_models: Dictionary = {
    "CHAIN_LINK": ["ogrodzenia/plotsiatka_3m.t3d", 2.975, "X_NEGATIVE"],
    "WIRE": ["ogrodzenia/plotsiatkastara_3m.t3d", 2.975, "X_NEGATIVE"],
    "BARBED_WIRE": ["ogrodzenia/plotwojsko_3m.t3d", 2.94, "X_NEGATIVE"],
    "ELECTRIC": ["ogrodzenia/plotsiatkastara_3m.t3d", 2.975, "X_NEGATIVE"],
    "WOOD": ["ogrodzenia/plot-deskowy-drewniany-mniszek-stelmet_940cm.t3d", 9.4, "Z_POSITIVE"],
    "BOARD": ["ogrodzenia/plot-deskowy-drewniany-mniszek-stelmet_940cm.t3d", 9.4, "Z_POSITIVE"],
    "PICKETS": ["ogrodzenia/plot-sztachetowy-drewniany-stelmet_940cm.t3d", 9.2, "Z_POSITIVE"],
    "SPLIT_RAIL": ["ogrodzenia/parkan1_10m.t3d", 10.0, "Z_POSITIVE"],
    "CONCRETE": ["ogrodzenia/plot_beton_plyty2_10m.t3d", 10.0, "Z_POSITIVE"],
}
## Any other fence, or one of no type: a house's welded panel, 1.4 m
@export var fence_model: Array = ["ogrodzenia/panel-ogrodzeniowy-vera-ocnyk-wisniowski_518cm.t3d", 5.18, "Z_POSITIVE"]
## A road guard rail (1.15 m), a gate where a road passes a fence, a wicket where a path does or
## nothing is known - as the fences' models
@export var fence_guard_rail: Array = ["ogrodzenia/2023_barierka_metalowa_1.t3d", 5.01, "Z_POSITIVE"]
@export var fence_gate: Array = ["ogrodzenia/brama-dwuskrzydlowa-stark-400cm.t3d", 4.12, "X_CENTRED"]
@export var fence_wicket: Array = ["ogrodzenia/furtka-panelowa-stark-polbram-100cm.t3d", 1.12, "X_CENTRED"]
## A bollard (barrier=bollard), a lift gate on a road (the crossings' barrier of a shorter arm, turned
## as it)
@export var fence_bollard: String = "slupek_niski_60cm.t3d"
@export var fence_lift_gate: String = "pkp/szlab_d_45.t3d"
@export var fence_lift_gate_turn: float = 0.0
## A wall's and a hedge's box: [texture, height when height=* is missing [m], thickness [m], metres one
## repeat of the texture covers]
@export var fence_wall: Array = ["mur", 2.0, 0.25, 2.0]
@export var fence_hedge: Array = ["zywoplot", 1.5, 0.8, 2.0]

@export_group("Roads")
## The asphalt's: a two-way road of a class with a centre line, the others, the shoulder (as the
## original sceneries have them, linia053/misja1_drogi.scm); a dirt road's (a track, an unpaved one)
@export var road_lines_texture: String = "asphalt1_dashedwhite"
@export var road_plain_texture: String = "asphalt1_nolines"
@export var road_shoulder_texture: String = "asphalt1_side1"
@export var road_dirt_texture: String = "droga_polna"
## The zebras' and the car parks' bay lines
@export var road_marking_texture: String = "beton_white"

@export_group("Power lines")
## The kinds of line: the nodebank's category of their poles, the width of their wires and their sag
## at the middle of a span [m] - l27's, druty_*.scm (the width of its nodes, the median sag of its
## spans); a power=line of towers, of poles, a power=minor_line
@export var power_high_voltage: Dictionary = {"keyword": "slupy wn", "width": 5.0, "sag": 3.0}
@export var power_medium_voltage: Dictionary = {"keyword": "slupy sn", "width": 1.5, "sag": 1.0}
@export var power_low_voltage: Dictionary = {"keyword": "slupy nn", "width": 0.9, "sag": 0.4}

@export_group("Buildings")
## Facades of the extruded buildings by the nodebank's category of the building, textures of the game's
## textures/: one-storey strips made for bud/blok_4 and the like, or tileable walls. [texture, tile
## width m, tile height m, storeys the tile holds (0: tileable, not snapped to storeys), u where the
## facade ends, flat roof texture] (bud/blachaogr01, sheet metal, is left out: its dark top and bottom
## edges stacked a hall into boxes)
@export var building_facades: Dictionary = {
    "bloki": [
        ["bud/blokblue", 10.8, 2.8, 1, BLOK_U_MAX, "roof/papa"],
        ["bud/blok", 10.8, 2.8, 1, BLOK_U_MAX, "roof/papa"],
        ["bud/blokgreen", 10.8, 2.8, 1, BLOK_U_MAX, "roof/papa"],
        ["bud/blokniebpas", 10.8, 2.8, 1, BLOK_U_MAX, "roof/papa"],
        ["bud/bloknielpas", 10.8, 2.8, 1, BLOK_U_MAX, "roof/papa"],
        ["bud/blokzolpas", 10.8, 2.8, 1, BLOK_U_MAX, "roof/papa"],
        ["bud/blokpompas", 10.8, 2.8, 1, BLOK_U_MAX, "roof/papa"],
        ["bud/blokczerpas", 10.8, 2.8, 1, BLOK_U_MAX, "roof/papa"],
        ["bud/blokfiolpas", 10.8, 2.8, 1, BLOK_U_MAX, "roof/papa"],
        ["bud/blookrange", 10.8, 2.8, 1, BLOK_U_MAX, "roof/papa"],
    ],
    "kamienice": [
        ["bud/dom1tynk02a", 26.0, 6.5, 2, 1.0, "roof/papa"],
        ["bud/domcegla01a", 12.8, 3.2, 1, 1.0, "roof/papa"],
    ],
    "domki": [
        ["bud/domtynk02a", 12.0, 3.0, 1, 1.0, "roof/papa"],
        ["bud/domtynk01a", 12.0, 3.0, 1, 1.0, "roof/papa"],
        ["bud/domcegla01a", 12.0, 3.0, 1, 1.0, "roof/papa"],
    ],
    "stodoly": [
        ["bud/stodoladrew01", 8.0, 4.0, 1, 1.0, "roof/blacha_falista"],
        ["bud/stodoladrew02", 8.0, 4.0, 1, 1.0, "roof/blacha_falista"],
    ],
    "przemysl": [
        ["bud2/lokkrpl-scianazew", 24.0, 6.0, 1, 1.0, "roof/blacha_falista"],
        ["bud2/kopalnia-sciana1", 9.0, 4.5, 1, 1.0, "roof/blacha_falista"],
        ["bud/windowindustrial1", 8.0, 4.0, 1, 1.0, "roof/blacha_falista"],
    ],
    "dworce": [["wall/wallbricksbrown_a", 1.0, 1.0, 0, 1.0, "roof/papa"]],
    "nastawnie": [["wall/wallbricksbrown_a", 1.0, 1.0, 0, 1.0, "roof/papa"]],
    "": [
        ["bud/domtynk02b", 6.0, 3.0, 1, 1.0, "roof/papa"],
        ["wall/bricks_red", 2.1, 1.4, 0, 1.0, "roof/papa"],
    ],
}
## A garage's (building=garage|garages) and a brick building's (building:material=brick) facade
@export var building_garage_facade: Array = ["bud/garazx3-1", 10.4, 2.6, 1, 1.0, "roof/papa"]
@export var building_brick_facade: Array = ["wall/bricks_red", 2.1, 1.4, 0, 1.0, "roof/papa"]
## The nodebank's categories a point object's model is picked from, by its "<tag>=<value>" (the
## lowercased category's name containing one)
@export var point_categories: Dictionary = {
    "natural=tree": PackedStringArray(["male drzewka", "duze drzewka"]),
    "power=tower": PackedStringArray(["slupy wn"]),
    "power=pole": PackedStringArray(["slupy sn"]),
    "highway=street_lamp": PackedStringArray(["lampy"]),
    "railway=buffer_stop": PackedStringArray(["oporowe"]),
}

@export_group("Waters")
## A water's surface (natural=water): the world assets' material (common_terrain/water.tres: the
## game's @water06 waves and reflection, clear where shallow, foam at the shore) and the metres one
## repeat covers
@export var water_material: String = "res://world_assets/common_terrain/water.tres"
@export var water_metres: float = 20.0

@export_group("Town")
## The sidewalks' slabs, the paved paths and squares, the kerbs, a playground's sand - each with the
## metres one repeat of it covers
@export var town_sidewalk_texture: String = "chodnik-1x2m"
@export var town_sidewalk_metres: float = 2.0
@export var town_path_texture: String = "kostka_szara"
@export var town_path_metres: float = 2.0
@export var town_kerb_texture: String = "beton_white"
@export var town_sand_texture: String = "piach_plaza"
@export var town_sand_metres: float = 5.0
## A playground's equipment, recoloured (the facades' material)
@export var town_equipment_texture: String = "beton_white"
## Benches and waste baskets: [path, skin, range] of the game's models as the nodebank lists them
## (nodebank.txt: "node 500 0 none model ... miejskie/lawka_pkp.t3d miejskie\lawka_pkp"), picked by the
## OSM id; a parking ticket machine (vending=parking_tickets) as they
@export var town_benches: Array = [["miejskie/lawka_stara.t3d", "miejskie/lawka_stara", 500.0],
        ["miejskie/lawka_pkp.t3d", "miejskie/lawka_pkp", 500.0], ["miejskie/lawka_pkp.t3d", "miejskie/lawka_pkp_zielona", 500.0]]
@export var town_waste_baskets: Array = [["peronowe/kosz_szary.t3d", "none", 2000.0], ["peronowe/kosz_zielony.t3d", "none", 2000.0]]
@export var town_ticket_machine: Array = ["miejskie/parkomat_rozi_macius9551.t3d", "none", 500.0]
## A flowerbed's planters (nodebank.txt: "node 200 0 none model ... miejskie/donica_1.t3d
## miejskie/donice_new"), the ones with plants, about 1.3-1.5 x 1.5-1.75 m (donica_1, donica_7.e3d)
@export var town_planters: PackedStringArray = ["miejskie/donica_1.t3d", "miejskie/donica_2.t3d", "miejskie/donica_3.t3d",
        "miejskie/donica_4.t3d", "miejskie/donica_5.t3d", "miejskie/donica_6.t3d", "miejskie/donica_7.t3d",
        "miejskie/donica_8.t3d", "miejskie/donica_9.t3d", "miejskie/donica_10.t3d", "miejskie/donica_11.t3d",
        "miejskie/donica_12.t3d", "miejskie/donica_13.t3d", "miejskie/donica_14.t3d"]
@export var town_planter_skin: String = "miejskie/donice_new"
## A football pitch's goals by its length [m]: [shortest, path] - the goal's width along its X
@export var town_goals: Array = [[0.0, "miejskie/sportowe/bramka_wkopana3x2.t3d"], [40.0, "miejskie/sportowe/bramka_wkopana5x2.t3d"],
        [70.0, "miejskie/sportowe/bramka_wkopana7x2.t3d"]]
