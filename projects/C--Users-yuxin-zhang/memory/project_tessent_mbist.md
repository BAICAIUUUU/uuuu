---
name: Tessent MBIST DiagnosisOptions 与 ROM 签名失败处理
description: 用户在做 Tessent MemoryBIST pattern 仿真调试；compare_go/compare_misr/expected_rom_signature/rom_content_file 属性的作用及 ROM 内容变更导致 GO fail 的官方处理路径
type: project
originSessionId: 7f6a9e91-e847-4b29-a1da-48c2a426b095
---
用户的工作涉及 Tessent MemoryBIST pattern 仿真验证（VCS），曾遇到 ROM BIST 控制器（c2, ilm_rom）GO 位在 JTAG_TDO 上 mismatch（simulated 0 / expected 1），MISR golden 签名 0x781391FAF3A7264A。

**Why:** Tessent DiagnosisOptions 文档明确：ROM 的 pass/fail 默认由 MISR 签名决定（签名编码在 memory interface 中或存在 TSDB）。ROM 内容变更后，最终签名与默认签名不符 → GO=fail。这正是用户遇到的失败机制。

**How to apply:** 再遇到类似 MBIST pattern GO mismatch 时：
- ROM 测试 fail 的标准解法：设 `compare_go off`，并用 `expected_rom_signature` 提供新签名，或用 `rom_content_file` 提供新 ROM 内容让工具重算签名；或修正仿真加载的 ROM 数据使其与 TSDB 中签名一致。
- `compare_go on` 时的配套惯例：测 RAM 通常开 `compare_memory_go` 或 `compare_go_id`；测 ROM 开 `compare_misr`。
- memory self repair flow 中某些 pattern 必须关 compare_go（见 Tessent MemoryBIST User's Manual）。
- 排障方向优先级：先确认仿真 ROM hex 与出 pattern 时 ROM 数据是否同版本。
