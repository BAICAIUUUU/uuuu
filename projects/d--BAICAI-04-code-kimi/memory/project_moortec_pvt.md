---
name: Moortec PVT sensor IP project context
description: User works with Moortec/Synopsys PVT monitoring IP — TS4 temperature sensor MR74127 (TSMC 28nm HPC+) and PVT Controller Series 3+ (MR75203/MR75007) with APB interface
type: project
originSessionId: eaf6ead6-7c75-495c-af82-9abcf1fd8425
---
User is working with Moortec (now Synopsys) embedded PVT monitoring IP:
- TS4 (Series 4) embedded temperature sensor, part MR74127, targeting TSMC 28nm HPC+ (VDD 0.9V, VDDA 1.8V)
- PVT Controller Series 3+ (PVTC-3): digital controller MR75007 + APB interface MR75001, wrapped as MR75203; top-level 28HPC+ wrapper is MR75520 (2.5V TS-only variant: MR75515)
- Sensors connect to the controller via Serial Data Adaptors (SDA/SDIF) in a star topology to minimize routing; alarm/interrupt driven, with run-once/run-continuous modes

**Why:** Studied the vendor documentation set on 2026-08-27 to build understanding before implementation/integration work.

**How to apply:** When the user asks about temperature sensing, PVT, calibration (K/Y trim), SDIF registers, or APB programming sequences (PG00–PG07), refer to these docs. The TS4 + PVTC-3 + 28HPC+ combination is the relevant configuration.
