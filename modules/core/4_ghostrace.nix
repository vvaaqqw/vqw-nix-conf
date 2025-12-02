{ config, pkgs, ... }:

{
  # 关键：一次性干掉 E14 Gen 2 的 DMAR + UCSI 卡死
  boot.kernelParams = [
    "quiet"
    "splash"
    "intel_iommu=off"                # 彻底关闭有 bug 的 DMAR 表
    "pci=pcie_bus_safe"              # 安全模式扫描 PCIe，防止 UCSI 控制器挂起
    "ucsi_acpi.skip_resume_workaround"  # 跳过 ucsi_acpi 那个会死等的 workaround
  ];
}
