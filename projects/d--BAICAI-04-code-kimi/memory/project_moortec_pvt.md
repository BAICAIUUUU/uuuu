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

WANGYOU project (D:\BAICAI\03_qx_project\03_wangyou) specifics:
- Accesses the PVTC through the IJTAG/TDR test access interface (TAM), NOT the APB functional path: tdr0=ta_req/ta_ack, tdr1=control (ta_ipsel/ta_select/ta_rsel), tdr2=write (ta_load/ta_wdata), tdr3=read (ta_busy/ta_lock/ta_rdata)
- Only 1 TS instance attached (SDIF_DISABLE bit0=0 enables it); TAM CLK_SYNTH=0x01011F1E; run-once ip_ctrl=0x104; verified real temp read 0x0725 (~25°C) after ~100000 tck wait
- Scan test: tm_te tied to ltest_en so PVT tests as pure digital logic
- Also has Cyansemi cs_tsensor_t22ull (TSMC 22ULL) sensor datasheet — same architecture as TS4 but supports 1 local + up to 15 remote sensors (ssel[3:0], pdrv*/cdrv[15:1]), Fclk up to 2.3MHz

**Why:** Studied the vendor documentation set on 2026-08-27 to build understanding before implementation/integration work; wangyou TDR-based bring-up done 2026-09-21.

**How to apply:** When the user asks about temperature sensing, PVT, calibration (K/Y trim), SDIF registers, APB programming sequences (PG00–PG07), or TAM/TDR access, refer to these docs. The TS4 + PVTC-3 + 28HPC+ combination is the relevant configuration; for wangyou, prefer TDR/TAM flows over APB flows.
