---
name: Moortec PVT sensor documentation locations
description: Locations of the Moortec TS4/PVT Controller PDF docs and their extracted plain-text versions for fast re-reading
type: reference
originSessionId: eaf6ead6-7c75-495c-af82-9abcf1fd8425
---
Moortec PVT sensor documentation set:
- PDFs: `D:\BAICAI\02_pdf\tsensor\`
  - `DMS4002a_TS4_Datasheet_v1r18.pdf` — TS4 temperature sensor datasheet (19 pages)
  - `DMS5083a_TS4_PES_MR74127_v1r1.pdf` — MR74127 product electrical spec, TSMC 28HPC+ (3 pages)
  - `DMS5571a - PVT Controller Series 3plus (Incl. Serial Test Access) Design Specification.pdf` — PVTC-3 design spec (108 pages)
- Pre-extracted plain text (via pypdf, page markers `===== PAGE n =====`): `D:\BAICAI\02_pdf\tsensor\extracted\*.txt`

**How to apply:** Read the extracted .txt files instead of re-parsing PDFs (Read tool's PDF path is broken on this machine — pdftoppm missing; use pypdf via `pip install pypdf` if re-extraction is needed).
