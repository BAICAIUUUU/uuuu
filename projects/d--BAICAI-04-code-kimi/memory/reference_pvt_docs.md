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

WANGYOU project docs: `D:\BAICAI\03_qx_project\03_wangyou\`
- `260619.cs_tsensor_t22ull_datasheet.pdf` — Cyansemi TSMC 22ULL temp sensor (19 pages, remote-sensor capable)
- `WANGYOU-PVT.docx` / `PVT TEST (1).docx` — project TDR config + test sequence notes
- `PVT_完整文档.md` / `PVT_完整文档.docx` — consolidated PVT document I compiled 2026-09 (TS4 + t22ull + PVTC-3 + TAM/TDR + wangyou flows)
- Extracted text + md2docx.py converter: `D:\BAICAI\03_qx_project\03_wangyou\extracted\`

**How to apply:** Read the extracted .txt files instead of re-parsing PDFs (Read tool's PDF path is broken on this machine — pdftoppm missing; use pypdf via `pip install pypdf` if re-extraction is needed). pip installs from pypi hang on this machine — prefer stdlib-only scripts.
