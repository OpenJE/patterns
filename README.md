# ImHex Patterns for Van Buren (Jefferson Engine)

This repository contains [ImHex](https://imhex.werwolv.net/) pattern files for the proprietary file formats used in **Fallout: Van Buren** (also known as Project Jefferson), the cancelled Fallout 3 by Black Isle Studios.

## Overview

Van Buren uses a set of custom binary formats for 3D models, maps, creatures, items, GUI screens, archives, and more. These patterns document the structure of those files based on reverse-engineering work.

## Pattern Inventory

### Archive / Resource Layer

| Pattern | File | Description | Status |
|---------|------|-------------|--------|
| `chunk.pat` | — | Reusable chunk header (`tag[4] + version + size`) and string helpers | **New** |
| `grp.pat` | `.grp` | Group archive (header + lump table + raw data) | **Updated** |
| `rht.pat` | `resource.rht` | Resource hash table (catalog linking names → .grp lumps) | **Updated** |
| `stf.pat` | `.stf` | String table (localized text) | **Updated** |

### Text / Config

| Pattern | File | Description | Status |
|---------|------|-------------|--------|
| `psf.pat` | `.psf` | Sound configuration text (UTF-8) | **New** |
| `gsf.pat` | `.gsf` | Text file (UTF-8) | **New** |
| `gls.pat` | `.gls` | Group list text (UTF-8) | **New** |
| `sco.pat` | `.sco` | Sound text file (UTF-8) | **New** |
| `pce.pat` | `.pce` | Sound text file 2 (UTF-8) | **New** |

### 3D Models

| Pattern | File | Description | Status |
|---------|------|-------------|--------|
| `b3d.pat` | `.b3d` | B3D 1.1 tagged model format | **Updated** (TVertex44/64, surface, skinning) |
| `gr2.pat` | `.gr2` | Granny 2 format header | **Stub** (full parse needs Granny runtime) |

### Map / World

| Pattern | File | Description | Status |
|---------|------|-------------|--------|
| `tre.pat` | `.8` / `.tre` | 8TRE octree map geometry | **Updated** (HEAD, LGTD, MATD, VTXD, TREE chunks) |
| `Map.pat` | `.map` | Aggregate of map chunks | **Updated** |

### GUI / Interface

| Pattern | File | Description | Status |
|---------|------|-------------|--------|
| `int.pat` | `.int` | GUI screen layout (recursive objects, fragments, fonts) | **Updated** (label blocks, fragments, version branches) |

### Visual Effects

| Pattern | File | Description | Status |
|---------|------|-------------|--------|
| `rle.pat` | `.rle` | RLE-encoded grayscale image | **New** |
| `veg.pat` | `.veg` | VFX/shader file | **Updated** (VFX blocks, property union) |

### Entity / Item Files

| Pattern | File | Description | Status |
|---------|------|-------------|--------|
| `CRT.pat` | `.crt` | Creature/character | **Updated** (EEN2→GENT→GCRE→GCHR) |
| `ITM.pat` | `.itm` | Generic item | **Updated** (EEN2→GENT→GITM) |
| `ARM.pat` | `.arm` | Armor | **Updated** (EEN2→GENT→GITM→GIAR) |
| `WEA.pat` | `.wea` | Weapon | **Updated** (EEN2→GENT→GITM→GIWP) |
| `AMO.pat` | `.amo` | Ammo | **Updated** (EEN2→GENT→GITM→GIAM) |
| `USE.pat` | `.use` | Usable object | **Updated** (EEN2→GENT→GOBJ) |
| `DOR.pat` | `.dor` | Door | **New** (EEN2→GENT→GOBJ + GDOR trailer) |
| `CON.pat` | `.con` | Container | **New** (EEN2→GENT→GOBJ + GCON trailer) |

### Component Chunks (used by Map/Entity files)

| Pattern | Description | Status |
|---------|-------------|--------|
| `EEN2c.pat` | Entity visual/inventory strings + EEOV | **Fixed** |
| `EEOVc.pat` | Inventory/overlay strings (s1..s5 + inv list) | **Fixed** (removed template, added bounds) |
| `EMAPc.pat` | Map metadata (3 strings, color, flags) | **Updated** |
| `EME2c.pat` | Map entity placement (name, Vector4, EEOV) | **Fixed** (added vector4 import) |
| `EMEFc.pat` | Map effect (string, Vector4, string, byte) | **Updated** |
| `EMEPc.pat` | Map entry point (index, position, rotation) | **Updated** |
| `EMFGc.pat` | Fog volume (heights, speeds, density) | **Updated** |
| `EMNOc.pat` | Map note/node (Vector2, texture, sr) | **Updated** |
| `EMNPc.pat` | Map navpoint chunks | **Fixed** (added count) |
| `EMSDc.pat` | Map sound (string, Vector3, string) | **Fixed** (import error) |
| `EMTRc.pat` | Trigger geometry (count + Vector3 array) | **Fixed** (added count) |
| `EPTHc.pat` | Path (name + Vector4 array) | **Fixed** (added count) |
| `ExTRc.pat` | Trigger action (type + string) | **Updated** |
| `ECAMc.pat` | Camera (Vector4) | **Updated** |
| `_2MWTc.pat` | Water/2MWT chunks | **Fixed** (added counts) |
| `GENTc.pat` | Generic entity stats (string refs, health, gap) | **Updated** (added Gap28to35) |
| `GCREc.pat` | Creature record (SPECIAL, skills, sockets, GWAM) | **Updated** (bounded arrays) |
| `GCHRc.pat` | Character name string | **Updated** |
| `GITMc.pat` | Item equip/sockets/flags | **Updated** |
| `GIARc.pat` | Armor resistances (6 values) | **Updated** |
| `GIAMc.pat` | Ammo stats (versioned: caliber, damage, etc.) | **Updated** (added version gating) |
| `GIWPc.pat` | Weapon data (versioned: class, calibers, attack modes) | **Updated** (added version gating) |
| `GWAMc.pat` | Weapon attack mode (versioned: anim, damage, range, AP) | **Updated** (added version gating) |
| `GOBJc.pat` | Object type (USE/DOR/CON) | **Fixed** (u8→u32) |
| `socket.pat` | Model/texture socket pair | **Updated** |
| `skill.pat` | Skill id/value pair | **Fixed** (u8+u8→u32+u32) |
| `trigger.pat` | EMTR + ExTR composite | **Updated** |

### Math Helpers

| Pattern | Description |
|---------|-------------|
| `vector2.pat` | 2D float vector |
| `vector3.pat` | 3D float vector |
| `vector4.pat` | 4D float vector |

## Chunk Framing

Most Van Buren data files use a common chunk system:

```
char[4] tag       // "EMAP", "EME2", "GCRE", etc.
u32     version   // format version
u32     size      // total bytes including this 12-byte header
u8[]    payload   // size - 12 bytes
```

Import `je.chunk` for the `ChunkHeader` struct and helper functions.

## Known Issues / TODO

1. **GR2** pattern is header-only; full parsing requires the Granny runtime
2. **RLZ** (type 900) and **RTD** (type 1000) — format unknown, deferred for future reverse-engineering
3. Most chunk component patterns model payload-only; they must be used inside a chunk wrapper (`tag + version + size`) for correct offsets
4. Signedness: many patterns use `u32` where the original source uses signed `int`; binary layout is identical but displayed values differ for negative numbers

## File Extensions Used by Van Buren

From `resource.rht` type mapping:

| Ext | Type | Description |
|-----|------|-------------|
| `.b3d` | 100 | 3D model (or `.g3d` if not "B3D " magic) |
| `.tga` | 200 | Texture (or `.bmp` if magic "BM") |
| `.8` | 400 | Octree map geometry (magic "8TRE") |
| `.rlz` | 900 | Unknown — no parser or text handling found |
| `.rtd` | 1000 | Unknown — no parser or text handling found |
| `.map` | 1300 | Map file |
| `.crt` | 1400 | Creature/character |
| `.veg` | 1500 | Visual effect |
| `.int` | 1600 | GUI screen |
| `.rle` | 1700 | RLE image |
| `.itm` | 1800 | Item |
| `.psf` | 1900 | Sound configuration text file (UTF-8) |
| `.gsf` | 2000 | Text file (UTF-8) |
| `.gls` | 2100 | Group list text file (UTF-8) |
| `.sco` | 2200 | Sound text file (UTF-8) |
| `.pce` | 2300 | Sound text file 2 (UTF-8) |
| `.wea` | 2400 | Weapon |
| `.arm` | 2500 | Armor |
| `.dor` | 2600 | Door |
| `.use` | 2700 | Usable object |
| `.amo` | 3500 | Ammo |
| `.con` | 3600 | Container |
| `.txt` | 3700 | Text file |

## References

- [ImHex](https://imhex.werwolv.net/) — The hex editor these patterns are built for
