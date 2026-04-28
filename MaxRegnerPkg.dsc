## @file
# Copyright (C) 2018, vit9696.  All rights reserved.<BR>
# Copyright (C) 2018, Download-Fritz.  All rights reserved.<BR>
#
# Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
#
# 3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
##

[Defines]
  PLATFORM_NAME           = MaxRegnerPkg
  PLATFORM_GUID           = C46F121D-ABC6-42A3-A241-91B09224C357
  PLATFORM_VERSION        = 1.0
  SUPPORTED_ARCHITECTURES = X64|IA32
  BUILD_TARGETS           = RELEASE|DEBUG|NOOPT
  SKUID_IDENTIFIER        = DEFAULT
  DSC_SPECIFICATION       = 0x00010006
  FLASH_DEFINITION        = MaxRegnerPkg/MaxRegnerPkg.fdf

  #
  # Network definition
  #
  DEFINE NETWORK_ENABLE                 = TRUE
  DEFINE NETWORK_SNP_ENABLE             = TRUE
  DEFINE NETWORK_IP4_ENABLE             = TRUE
  DEFINE NETWORK_IP6_ENABLE             = TRUE
  DEFINE NETWORK_TLS_ENABLE             = TRUE
  DEFINE NETWORK_HTTP_ENABLE            = TRUE
  DEFINE NETWORK_HTTP_BOOT_ENABLE       = TRUE
  DEFINE NETWORK_ALLOW_HTTP_CONNECTIONS = TRUE
  DEFINE NETWORK_ISCSI_ENABLE           = FALSE
  DEFINE NETWORK_ISCSI_MD5_ENABLE       = FALSE
  DEFINE NETWORK_VLAN_ENABLE            = FALSE

!include NetworkPkg/NetworkDefines.dsc.inc

!include MdePkg/MdeLibs.dsc.inc

[LibraryClasses]
  BaseLib|MdePkg/Library/BaseLib/BaseLib.inf
  # We cannot use BaseMemoryLibOptDxe since it uses SSE instructions,
  # and some types of firmware fail to properly maintain MMX register contexts
  # across the timers. This results in exceptions when trying to execute
  # primitives like CopyMem in timers (e.g. AIKDataWriteEntry).
  # Reproduced on ASUS M5A97 with AMD FX8320 CPU.
  # REF: https://github.com/acidanthera/bugtracker/issues/754
  BaseMemoryLib|MdePkg/Library/BaseMemoryLibRepStr/BaseMemoryLibRepStr.inf
  BaseOverflowLib|MdePkg/Library/BaseOverflowLib/BaseOverflowLib.inf
  BaseRngLib|MdePkg/Library/BaseRngLib/BaseRngLib.inf
  BcfgCommandLib|ShellPkg/Library/UefiShellBcfgCommandLib/UefiShellBcfgCommandLib.inf
  CacheMaintenanceLib|MdePkg/Library/BaseCacheMaintenanceLib/BaseCacheMaintenanceLib.inf
  CpuLib|MdePkg/Library/BaseCpuLib/BaseCpuLib.inf
  DebugLib|MaxRegnerPkg/Library/OcDebugLibProtocol/OcDebugLibProtocol.inf
  DxeServicesLib|MdePkg/Library/DxeServicesLib/DxeServicesLib.inf
  MtrrLib|UefiCpuPkg/Library/MtrrLib/MtrrLib.inf
  DebugPrintErrorLevelLib|MdePkg/Library/BaseDebugPrintErrorLevelLib/BaseDebugPrintErrorLevelLib.inf
  DevicePathLib|MdePkg/Library/UefiDevicePathLib/UefiDevicePathLib.inf
  DxeServicesTableLib|MdePkg/Library/DxeServicesTableLib/DxeServicesTableLib.inf
  FileHandleLib|MdePkg/Library/UefiFileHandleLib/UefiFileHandleLib.inf
  VirtioLib|OvmfPkg/Library/VirtioLib/VirtioLib.inf
  FrameBufferBltLib|MdeModulePkg/Library/FrameBufferBltLib/FrameBufferBltLib.inf
  HandleParsingLib|ShellPkg/Library/UefiHandleParsingLib/UefiHandleParsingLib.inf
  OrderedCollectionLib|MdePkg/Library/BaseOrderedCollectionRedBlackTreeLib/BaseOrderedCollectionRedBlackTreeLib.inf
  HiiLib|MdeModulePkg/Library/UefiHiiLib/UefiHiiLib.inf
  HobLib|MdePkg/Library/DxeHobLib/DxeHobLib.inf
  IoLib|MdePkg/Library/BaseIoLibIntrinsic/BaseIoLibIntrinsic.inf
  MemoryAllocationLib|MdePkg/Library/UefiMemoryAllocationLib/UefiMemoryAllocationLib.inf
  OcAcpiLib|MaxRegnerPkg/Library/OcAcpiLib/OcAcpiLib.inf
  OcAfterBootCompatLib|MaxRegnerPkg/Library/OcAfterBootCompatLib/OcAfterBootCompatLib.inf
  OcApfsLib|MaxRegnerPkg/Library/OcApfsLib/OcApfsLib.inf
  OcAppleBootPolicyLib|MaxRegnerPkg/Library/OcAppleBootPolicyLib/OcAppleBootPolicyLib.inf
  OcAppleChunklistLib|MaxRegnerPkg/Library/OcAppleChunklistLib/OcAppleChunklistLib.inf
  OcAppleDiskImageLib|MaxRegnerPkg/Library/OcAppleDiskImageLib/OcAppleDiskImageLib.inf
  OcAppleEventLib|MaxRegnerPkg/Library/OcAppleEventLib/OcAppleEventLib.inf
  OcAppleImageConversionLib|MaxRegnerPkg/Library/OcAppleImageConversionLib/OcAppleImageConversionLib.inf
  OcAppleImg4Lib|MaxRegnerPkg/Library/OcAppleImg4Lib/OcAppleImg4Lib.inf
  OcAppleKernelLib|MaxRegnerPkg/Library/OcAppleKernelLib/OcAppleKernelLib.inf
  OcAppleKeyMapLib|MaxRegnerPkg/Library/OcAppleKeyMapLib/OcAppleKeyMapLib.inf
  OcAppleKeysLib|MaxRegnerPkg/Library/OcAppleKeysLib/OcAppleKeysLib.inf
  OcAppleRamDiskLib|MaxRegnerPkg/Library/OcAppleRamDiskLib/OcAppleRamDiskLib.inf
  OcAppleSecureBootLib|MaxRegnerPkg/Library/OcAppleSecureBootLib/OcAppleSecureBootLib.inf
  OcAppleUserInterfaceThemeLib|MaxRegnerPkg/Library/OcAppleUserInterfaceThemeLib/OcAppleUserInterfaceThemeLib.inf
  OcAudioLib|MaxRegnerPkg/Library/OcAudioLib/OcAudioLib.inf
  OcBlitLib|MaxRegnerPkg/Library/OcBlitLib/OcBlitLib.inf
  OcBootManagementLib|MaxRegnerPkg/Library/OcBootManagementLib/OcBootManagementLib.inf
  OcBootServicesTableLib|MaxRegnerPkg/Library/OcBootServicesTableLib/OcBootServicesTableLib.inf
  OcCompressionLib|MaxRegnerPkg/Library/OcCompressionLib/OcCompressionLib.inf
  OcConfigurationLib|MaxRegnerPkg/Library/OcConfigurationLib/OcConfigurationLib.inf
  OcConsoleControlEntryModeGenericLib|MaxRegnerPkg/Library/OcConsoleControlEntryModeLib/OcConsoleControlEntryModeGenericLib.inf
  OcConsoleControlEntryModeLocalLib|MaxRegnerPkg/Library/OcConsoleControlEntryModeLib/OcConsoleControlEntryModeLocalLib.inf
  OcConsoleLib|MaxRegnerPkg/Library/OcConsoleLib/OcConsoleLib.inf
  OcCpuLib|MaxRegnerPkg/Library/OcCpuLib/OcCpuLib.inf
  OcCryptoLib|MaxRegnerPkg/Library/OcCryptoLib/OcCryptoLib.inf
  OcDataHubLib|MaxRegnerPkg/Library/OcDataHubLib/OcDataHubLib.inf
  OcDeviceMiscLib|MaxRegnerPkg/Library/OcDeviceMiscLib/OcDeviceMiscLib.inf
  OcDevicePathLib|MaxRegnerPkg/Library/OcDevicePathLib/OcDevicePathLib.inf
  OcDevicePropertyLib|MaxRegnerPkg/Library/OcDevicePropertyLib/OcDevicePropertyLib.inf
  OcDeviceTreeLib|MaxRegnerPkg/Library/OcDeviceTreeLib/OcDeviceTreeLib.inf
  OcDirectResetLib|MaxRegnerPkg/Library/OcDirectResetLib/OcDirectResetLib.inf
  OcDriverConnectionLib|MaxRegnerPkg/Library/OcDriverConnectionLib/OcDriverConnectionLib.inf
  OcFileLib|MaxRegnerPkg/Library/OcFileLib/OcFileLib.inf
  OcFirmwarePasswordLib|MaxRegnerPkg/Library/OcFirmwarePasswordLib/OcFirmwarePasswordLib.inf
  OcFirmwareVolumeLib|MaxRegnerPkg/Library/OcFirmwareVolumeLib/OcFirmwareVolumeLib.inf
  OcFlexArrayLib|MaxRegnerPkg/Library/OcFlexArrayLib/OcFlexArrayLib.inf
  OcGuardLib|MaxRegnerPkg/Library/OcGuardLib/OcGuardLib.inf
  OcHashServicesLib|MaxRegnerPkg/Library/OcHashServicesLib/OcHashServicesLib.inf
  OcHdaDevicesLib|MaxRegnerPkg/Library/OcHdaDevicesLib/OcHdaDevicesLib.inf
  OcHeciLib|MaxRegnerPkg/Library/OcHeciLib/OcHeciLib.inf
  OcHiiDatabaseLocalLib|MaxRegnerPkg/Library/OcHiiDatabaseLib/OcHiiDatabaseLocalLib.inf
  OcInputLib|MaxRegnerPkg/Library/OcInputLib/OcInputLib.inf
  OcLegacyThunkLib|MaxRegnerPkg/Library/OcLegacyThunkLib/OcLegacyThunkLib.inf
  OcLogAggregatorLib|MaxRegnerPkg/Library/OcLogAggregatorLib/OcLogAggregatorLib.inf
  OcMachoLib|MaxRegnerPkg/Library/OcMachoLib/OcMachoLib.inf
  OcMacInfoLib|MaxRegnerPkg/Library/OcMacInfoLib/OcMacInfoLib.inf
  OcMainLib|MaxRegnerPkg/Library/OcMainLib/OcMainLib.inf
  OcMemoryLib|MaxRegnerPkg/Library/OcMemoryLib/OcMemoryLib.inf
  OcMiscLib|MaxRegnerPkg/Library/OcMiscLib/OcMiscLib.inf
  OcMp3Lib|MaxRegnerPkg/Library/OcMp3Lib/OcMp3Lib.inf
  OcOSInfoLib|MaxRegnerPkg/Library/OcOSInfoLib/OcOSInfoLib.inf
  OcPciIoLib|MaxRegnerPkg/Library/OcPciIoLib/OcPciIoLib.inf
  OcPngLib|MaxRegnerPkg/Library/OcPngLib/OcPngLib.inf
  OcRngLib|MaxRegnerPkg/Library/OcRngLib/OcRngLib.inf
  OcRtcLib|MaxRegnerPkg/Library/OcRtcLib/OcRtcLib.inf
  OcSerializeLib|MaxRegnerPkg/Library/OcSerializeLib/OcSerializeLib.inf
  OcSmbiosLib|MaxRegnerPkg/Library/OcSmbiosLib/OcSmbiosLib.inf
  OcSmcLib|MaxRegnerPkg/Library/OcSmcLib/OcSmcLib.inf
  OcStorageLib|MaxRegnerPkg/Library/OcStorageLib/OcStorageLib.inf
  OcStringLib|MaxRegnerPkg/Library/OcStringLib/OcStringLib.inf
  OcTemplateLib|MaxRegnerPkg/Library/OcTemplateLib/OcTemplateLib.inf
  OcTypingLib|MaxRegnerPkg/Library/OcTypingLib/OcTypingLib.inf
  TimerLib|MaxRegnerPkg/Library/OcTimerLib/OcTimerLib.inf
  OcUnicodeCollationEngGenericLib|MaxRegnerPkg/Library/OcUnicodeCollationEngLib/OcUnicodeCollationEngGenericLib.inf
  OcUnicodeCollationEngLocalLib|MaxRegnerPkg/Library/OcUnicodeCollationEngLib/OcUnicodeCollationEngLocalLib.inf
  OcVirtualFsLib|MaxRegnerPkg/Library/OcVirtualFsLib/OcVirtualFsLib.inf
  OcWaveLib|MaxRegnerPkg/Library/OcWaveLib/OcWaveLib.inf
  OcXmlLib|MaxRegnerPkg/Library/OcXmlLib/OcXmlLib.inf
  OcPeCoffExtLib|MaxRegnerPkg/Library/OcPeCoffExtLib/OcPeCoffExtLib.inf
  OcVariableLib|MaxRegnerPkg/Library/OcVariableLib/OcVariableLib.inf
  OcVariableRuntimeLib|MaxRegnerPkg/Library/OcVariableRuntimeLib/OcVariableRuntimeLib.inf
  PcdLib|MdePkg/Library/BasePcdLibNull/BasePcdLibNull.inf
  PciCf8Lib|MdePkg/Library/BasePciCf8Lib/BasePciCf8Lib.inf
  PciCapLib|OvmfPkg/Library/BasePciCapLib/BasePciCapLib.inf
  PciCapPciIoLib|OvmfPkg/Library/UefiPciCapPciIoLib/UefiPciCapPciIoLib.inf
  PciLib|MdePkg/Library/BasePciLibCf8/BasePciLibCf8.inf
  PeCoffLib2|MdePkg/Library/BasePeCoffLib2/BasePeCoffLib2.inf
  PerformanceLib|MdePkg/Library/BasePerformanceLibNull/BasePerformanceLibNull.inf
  PlatformHookLib|MdeModulePkg/Library/BasePlatformHookLibNull/BasePlatformHookLibNull.inf
  PrintLib|MdePkg/Library/BasePrintLib/BasePrintLib.inf
  ReportStatusCodeLib|MdePkg/Library/BaseReportStatusCodeLibNull/BaseReportStatusCodeLibNull.inf
  SerialPortLib|MdeModulePkg/Library/BaseSerialPortLib16550/BaseSerialPortLib16550.inf
  ShellCommandLib|ShellPkg/Library/UefiShellCommandLib/UefiShellCommandLib.inf
  ShellLib|ShellPkg/Library/UefiShellLib/UefiShellLib.inf
  SortLib|MdeModulePkg/Library/UefiSortLib/UefiSortLib.inf
  SynchronizationLib|MdePkg/Library/BaseSynchronizationLib/BaseSynchronizationLib.inf
  UefiApplicationEntryPoint|MaxRegnerPkg/Library/OcApplicationEntryPoint/UefiApplicationEntryPoint.inf
  UefiBootServicesTableLib|MdePkg/Library/UefiBootServicesTableLib/UefiBootServicesTableLib.inf
  UefiBootManagerLib|MdeModulePkg/Library/UefiBootManagerLib/UefiBootManagerLib.inf
  UefiDriverEntryPoint|MaxRegnerPkg/Library/OcDriverEntryPoint/UefiDriverEntryPoint.inf
  UefiHiiServicesLib|MaxRegnerPkg/Library/OcHiiServicesLib/OcHiiServicesLib.inf
  UefiImageExtraActionLib|MdePkg/Library/BaseUefiImageExtraActionLibNull/BaseUefiImageExtraActionLibNull.inf
  UefiLib|MdePkg/Library/UefiLib/UefiLib.inf
  UefiRuntimeServicesTableLib|MdePkg/Library/UefiRuntimeServicesTableLib/UefiRuntimeServicesTableLib.inf
  UefiUsbLib|MdePkg/Library/UefiUsbLib/UefiUsbLib.inf
  VariablePolicyHelperLib|MdeModulePkg/Library/VariablePolicyHelperLib/VariablePolicyHelperLib.inf
  VariableFlashInfoLib|MdeModulePkg/Library/BaseVariableFlashInfoLib/BaseVariableFlashInfoLib.inf
  ResetSystemLib|MaxRegnerPkg/Library/OcResetSystemLib/OcResetSystemLib.inf

  !if $(NETWORK_TLS_ENABLE) == TRUE
    BaseCryptLib|CryptoPkg/Library/BaseCryptLib/BaseCryptLib.inf
    # FileExplorerLib is for TlsAuthConfigDxe only (not used by us, but enabled by NETWORK_TLS_ENABLE)
    FileExplorerLib|MdeModulePkg/Library/FileExplorerLib/FileExplorerLib.inf
    IntrinsicLib|MdePkg/Library/IntrinsicLib/IntrinsicLib.inf
    OpensslLib|CryptoPkg/Library/OpensslLib/OpensslLib.inf
    RngLib|MdeModulePkg/Library/BaseRngLibTimerLib/BaseRngLibTimerLib.inf
    SafeIntLib|MdePkg/Library/BaseSafeIntLib/BaseSafeIntLib.inf
    TlsLib|CryptoPkg/Library/TlsLib/TlsLib.inf
  !endif

  !include NetworkPkg/NetworkLibs.dsc.inc

  HttpLib|NetworkPkg/Library/DxeHttpLib/DxeHttpLib.inf

  !include Ext4Pkg/Ext4Defines.dsc.inc
  !include Ext4Pkg/Ext4Libs.dsc.inc

[Components]
  MdeModulePkg/Bus/Pci/NvmExpressDxe/NvmExpressDxe.inf {
    <LibraryClasses>
      !if $(TARGET) == RELEASE
        DebugLib|MdePkg/Library/BaseDebugLibNull/BaseDebugLibNull.inf
      !endif
  }
  MdeModulePkg/Bus/Pci/XhciDxe/XhciDxe.inf {
    <LibraryClasses>
      !if $(TARGET) == RELEASE
        DebugLib|MaxRegnerPkg/Library/OcDebugLibNull/OcDebugLibNull.inf
      !endif
  }
  MdeModulePkg/Bus/Isa/Ps2MouseDxe/Ps2MouseDxe.inf
  MdeModulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KeyboardDxe.inf
  MdeModulePkg/Bus/Usb/UsbMouseDxe/UsbMouseDxe.inf
  MdeModulePkg/Universal/HiiDatabaseDxe/HiiDatabaseDxe.inf
  MaxRegnerPkg/Application/BootKicker/BootKicker.inf
  MaxRegnerPkg/Application/Bootstrap/Bootstrap.inf {
    <LibraryClasses>
      !if $(TARGET) != RELEASE
        # Force onscreen visible logging in DEBUG/NOOPT builds.
        NULL|MaxRegnerPkg/Library/OcConsoleControlEntryModeLib/OcConsoleControlEntryModeGenericLib.inf
      !endif
  }
  MaxRegnerPkg/Application/ChipTune/ChipTune.inf
  MaxRegnerPkg/Application/CleanNvram/CleanNvram.inf
  MaxRegnerPkg/Application/CsrUtil/CsrUtil.inf
  MaxRegnerPkg/Application/FontTester/FontTester.inf
  MaxRegnerPkg/Application/GopPerf/GopPerf.inf
  MaxRegnerPkg/Application/GopStop/GopStop.inf
  MaxRegnerPkg/Application/KeyTester/KeyTester.inf
  MaxRegnerPkg/Application/ListPartitions/ListPartitions.inf
  MaxRegnerPkg/Application/MmapDump/MmapDump.inf
  MaxRegnerPkg/Application/OpenControl/OpenControl.inf
  MaxRegnerPkg/Application/MaxRegner/MaxRegner.inf {
    <LibraryClasses>
      !if $(TARGET) != RELEASE
        # Force onscreen visible logging in DEBUG/NOOPT builds.
        NULL|MaxRegnerPkg/Library/OcConsoleControlEntryModeLib/OcConsoleControlEntryModeGenericLib.inf
      !endif
  }
  MaxRegnerPkg/Application/PavpProvision/PavpProvision.inf
  MaxRegnerPkg/Application/ResetSystem/ResetSystem.inf
  MaxRegnerPkg/Application/RtcRw/RtcRw.inf
  MaxRegnerPkg/Application/TpmInfo/TpmInfo.inf
  MaxRegnerPkg/Application/VerifyMemOpt/VerifyMemOpt.inf {
    <LibraryClasses>
      BaseMemoryLib|MdePkg/Library/BaseMemoryLibOptDxe/BaseMemoryLibOptDxe.inf
  }
  MaxRegnerPkg/Application/ControlMsrE2/ControlMsrE2.inf
  MaxRegnerPkg/Debug/GdbSyms/GdbSyms.inf
  MaxRegnerPkg/Library/OcAcpiLib/OcAcpiLib.inf
  MaxRegnerPkg/Library/OcAfterBootCompatLib/OcAfterBootCompatLib.inf
  MaxRegnerPkg/Library/OcApfsLib/OcApfsLib.inf
  MaxRegnerPkg/Library/OcAppleBootPolicyLib/OcAppleBootPolicyLib.inf
  MaxRegnerPkg/Library/OcAppleChunklistLib/OcAppleChunklistLib.inf
  MaxRegnerPkg/Library/OcAppleDiskImageLib/OcAppleDiskImageLib.inf
  MaxRegnerPkg/Library/OcAppleEventLib/OcAppleEventLib.inf
  MaxRegnerPkg/Library/OcAppleImageConversionLib/OcAppleImageConversionLib.inf
  MaxRegnerPkg/Library/OcAppleImg4Lib/OcAppleImg4Lib.inf
  MaxRegnerPkg/Library/OcAppleKernelLib/OcAppleKernelLib.inf
  MaxRegnerPkg/Library/OcAppleKeyMapLib/OcAppleKeyMapLib.inf
  MaxRegnerPkg/Library/OcAppleRamDiskLib/OcAppleRamDiskLib.inf
  MaxRegnerPkg/Library/OcAppleSecureBootLib/OcAppleSecureBootLib.inf
  MaxRegnerPkg/Library/OcAppleUserInterfaceThemeLib/OcAppleUserInterfaceThemeLib.inf
  MaxRegnerPkg/Library/OcAudioLib/OcAudioLib.inf
  MaxRegnerPkg/Library/OcBlitLib/OcBlitLib.inf
  MaxRegnerPkg/Library/OcBootManagementLib/OcBootManagementLib.inf
  MaxRegnerPkg/Library/OcBootServicesTableLib/OcBootServicesTableLib.inf
  MaxRegnerPkg/Library/OcCompressionLib/OcCompressionLib.inf
  MaxRegnerPkg/Library/OcConfigurationLib/OcConfigurationLib.inf
  MaxRegnerPkg/Library/OcConsoleControlEntryModeLib/OcConsoleControlEntryModeGenericLib.inf
  MaxRegnerPkg/Library/OcConsoleControlEntryModeLib/OcConsoleControlEntryModeLocalLib.inf
  MaxRegnerPkg/Library/OcConsoleLib/OcConsoleLib.inf
  MaxRegnerPkg/Library/OcCpuLib/OcCpuLib.inf
  MaxRegnerPkg/Library/OcCryptoLib/OcCryptoLib.inf
  MaxRegnerPkg/Library/OcDataHubLib/OcDataHubLib.inf
  MaxRegnerPkg/Library/OcDebugLibSerial/OcDebugLibSerial.inf
  MaxRegnerPkg/Library/OcDebugLibProtocol/OcDebugLibProtocol.inf
  MaxRegnerPkg/Library/OcDebugLibNull/OcDebugLibNull.inf
  MaxRegnerPkg/Library/OcDeviceMiscLib/OcDeviceMiscLib.inf
  MaxRegnerPkg/Library/OcDevicePathLib/OcDevicePathLib.inf
  MaxRegnerPkg/Library/OcDevicePropertyLib/OcDevicePropertyLib.inf
  MaxRegnerPkg/Library/OcDeviceTreeLib/OcDeviceTreeLib.inf
  MaxRegnerPkg/Library/OcDirectResetLib/OcDirectResetLib.inf
  MaxRegnerPkg/Library/OcDriverConnectionLib/OcDriverConnectionLib.inf
  MaxRegnerPkg/Library/OcFileLib/OcFileLib.inf
  MaxRegnerPkg/Library/OcFirmwarePasswordLib/OcFirmwarePasswordLib.inf
  MaxRegnerPkg/Library/OcFirmwareVolumeLib/OcFirmwareVolumeLib.inf
  MaxRegnerPkg/Library/OcFlexArrayLib/OcFlexArrayLib.inf
  MaxRegnerPkg/Library/OcGuardLib/OcGuardLib.inf
  MaxRegnerPkg/Library/OcHashServicesLib/OcHashServicesLib.inf
  MaxRegnerPkg/Library/OcHdaDevicesLib/OcHdaDevicesLib.inf
  MaxRegnerPkg/Library/OcHeciLib/OcHeciLib.inf
  MaxRegnerPkg/Library/OcHiiDatabaseLib/OcHiiDatabaseLocalLib.inf
  MaxRegnerPkg/Library/OcInputLib/OcInputLib.inf
  MaxRegnerPkg/Library/OcLogAggregatorLib/OcLogAggregatorLib.inf
  MaxRegnerPkg/Library/OcLogAggregatorLibNull/OcLogAggregatorLibNull.inf
  MaxRegnerPkg/Library/OcMachoLib/OcMachoLib.inf
  MaxRegnerPkg/Library/OcMainLib/OcMainLib.inf
  MaxRegnerPkg/Library/OcMemoryLib/OcMemoryLib.inf
  MaxRegnerPkg/Library/OcMiscLib/OcMiscLib.inf
  MaxRegnerPkg/Library/OcMp3Lib/OcMp3Lib.inf
  MaxRegnerPkg/Library/OcOSInfoLib/OcOSInfoLib.inf
  MaxRegnerPkg/Library/OcPeCoffExtLib/OcPeCoffExtLib.inf
  MaxRegnerPkg/Library/OcPngLib/OcPngLib.inf
  MaxRegnerPkg/Library/OcRngLib/OcRngLib.inf
  MaxRegnerPkg/Library/OcSerializeLib/OcSerializeLib.inf
  MaxRegnerPkg/Library/OcSmbiosLib/OcSmbiosLib.inf
  MaxRegnerPkg/Library/OcSmcLib/OcSmcLib.inf
  MaxRegnerPkg/Library/OcStorageLib/OcStorageLib.inf
  MaxRegnerPkg/Library/OcStringLib/OcStringLib.inf
  MaxRegnerPkg/Library/OcTemplateLib/OcTemplateLib.inf
  MaxRegnerPkg/Library/OcTimerLib/OcTimerLib.inf
  MaxRegnerPkg/Library/OcUnicodeCollationEngLib/OcUnicodeCollationEngGenericLib.inf
  MaxRegnerPkg/Library/OcUnicodeCollationEngLib/OcUnicodeCollationEngLocalLib.inf
  MaxRegnerPkg/Library/OcPciIoLib/OcPciIoLib.inf
  MaxRegnerPkg/Library/OcVirtualFsLib/OcVirtualFsLib.inf
  MaxRegnerPkg/Library/OcWaveLib/OcWaveLib.inf
  MaxRegnerPkg/Library/OcXmlLib/OcXmlLib.inf
  MaxRegnerPkg/Legacy/BootPlatform/BiosVideo/BiosVideo.inf
  MaxRegnerPkg/Platform/CrScreenshotDxe/CrScreenshotDxe.inf
  MaxRegnerPkg/Platform/OpenCanopy/OpenCanopy.inf
  MaxRegnerPkg/Platform/OpenLegacyBoot/OpenLegacyBoot.inf
  MaxRegnerPkg/Platform/OpenLinuxBoot/OpenLinuxBoot.inf
  MaxRegnerPkg/Platform/OpenNetworkBoot/OpenNetworkBoot.inf
  MaxRegnerPkg/Platform/OpenNtfsDxe/OpenNtfsDxe.inf
  MaxRegnerPkg/Platform/OpenPartitionDxe/PartitionDxe.inf
  MaxRegnerPkg/Platform/OpenRuntime/OpenRuntime.inf
  MaxRegnerPkg/Platform/OpenUsbKbDxe/UsbKbDxe.inf
  MaxRegnerPkg/Platform/OpenVariableRuntimeDxe/VariableRuntimeDxe.inf {
    <PcdsFixedAtBuild>
      gEfiMdeModulePkgTokenSpaceGuid.PcdEmuVariableNvModeEnable|TRUE
      gEfiMdeModulePkgTokenSpaceGuid.PcdMaxVariableSize|0x10000
      gEfiMdeModulePkgTokenSpaceGuid.PcdVariableStoreSize|0x10000
    <LibraryClasses>
      UefiRuntimeLib|MdePkg/Library/UefiRuntimeLib/UefiRuntimeLib.inf
      SafeIntLib|MdePkg/Library/BaseSafeIntLib/BaseSafeIntLib.inf
      AuthVariableLib|MdeModulePkg/Library/AuthVariableLibNull/AuthVariableLibNull.inf
      TpmMeasurementLib|MdeModulePkg/Library/TpmMeasurementLibNull/TpmMeasurementLibNull.inf
      VarCheckLib|MdeModulePkg/Library/VarCheckLib/VarCheckLib.inf
      VariablePolicyLib|MdeModulePkg/Library/VariablePolicyLib/VariablePolicyLibRuntimeDxe.inf
      TimerLib|MaxRegnerPkg/Library/DuetTimerLib/DuetTimerLib.inf
      DebugLib|MaxRegnerPkg/Library/OcDebugLibNull/OcDebugLibNull.inf
      NULL|MaxRegnerPkg/Library/OcVariableRuntimeLib/OcVariableRuntimeLib.inf
  }
  MaxRegnerPkg/Platform/FirmwareSettingsEntry/FirmwareSettingsEntry.inf
  MaxRegnerPkg/Platform/ResetNvramEntry/ResetNvramEntry.inf
  MaxRegnerPkg/Platform/ToggleSipEntry/ToggleSipEntry.inf
  MaxRegnerPkg/Staging/AudioDxe/AudioDxe.inf
  MaxRegnerPkg/Staging/EnableGop/EnableGop.inf {
    <LibraryClasses>
      DebugLib|MaxRegnerPkg/Library/OcDebugLibNull/OcDebugLibNull.inf
  }
  MaxRegnerPkg/Staging/EnableGop/EnableGopDirect.inf {
    <LibraryClasses>
      DebugLib|MaxRegnerPkg/Library/OcDebugLibNull/OcDebugLibNull.inf
  }
  MaxRegnerPkg/Staging/OpenHfsPlus/OpenHfsPlus.inf
  MaxRegnerPkg/Tests/AcpiTest/AcpiTest.inf
  MaxRegnerPkg/Tests/AcpiTest/AcpiTestApp.inf
  MaxRegnerPkg/Tests/CryptoTest/CryptoTest.inf
  MaxRegnerPkg/Tests/CryptoTest/CryptoTestApp.inf
  MaxRegnerPkg/Tests/DataHubTest/DataHubTest.inf
  MaxRegnerPkg/Tests/DataHubTest/DataHubTestApp.inf
  MaxRegnerPkg/Tests/PropertyTest/PropertyTest.inf
  MaxRegnerPkg/Tests/PropertyTest/PropertyTestApp.inf
  MaxRegnerPkg/Tests/SmbiosTest/SmbiosTest.inf
  MaxRegnerPkg/Tests/SmbiosTest/SmbiosTestApp.inf
  # UEFI Shell with all commands integrated
  ShellPkg/Application/Shell/Shell.inf {
   <Defines>
      FILE_GUID = EA4BB293-2D7F-4456-A681-1F22F42CD0BC
    <PcdsFixedAtBuild>
      gEfiShellPkgTokenSpaceGuid.PcdShellLibAutoInitialize|FALSE
      # For some reason ShellPkg overrides this, so do we.
      gEfiMdePkgTokenSpaceGuid.PcdUefiLibMaxPrintBufferSize|16000
    <LibraryClasses>
      # Use custom BootServicesTable
      UefiBootServicesTableLib|MaxRegnerPkg/Library/OcBootServicesTableLib/UefiBootServicesTableLib.inf
      # Add the original commands.
      NULL|ShellPkg/Library/UefiShellLevel2CommandsLib/UefiShellLevel2CommandsLib.inf
      NULL|ShellPkg/Library/UefiShellLevel1CommandsLib/UefiShellLevel1CommandsLib.inf
      NULL|ShellPkg/Library/UefiShellLevel3CommandsLib/UefiShellLevel3CommandsLib.inf
      NULL|ShellPkg/Library/UefiShellDriver1CommandsLib/UefiShellDriver1CommandsLib.inf
      NULL|ShellPkg/Library/UefiShellInstall1CommandsLib/UefiShellInstall1CommandsLib.inf
      NULL|ShellPkg/Library/UefiShellDebug1CommandsLib/UefiShellDebug1CommandsLib.inf
      NULL|ShellPkg/Library/UefiShellNetwork1CommandsLib/UefiShellNetwork1CommandsLib.inf
      NULL|ShellPkg/Library/UefiShellNetwork2CommandsLib/UefiShellNetwork2CommandsLib.inf
      NULL|ShellPkg/Library/UefiShellAcpiViewCommandLib/UefiShellAcpiViewCommandLib.inf
  }

  # Ext4 driver
  Ext4Pkg/Ext4Dxe/Ext4Dxe.inf

  # RNG and HASH2 protocols are required by various network boot drivers since edk2-stable202405
  # REF: https://github.com/acidanthera/bugtracker/issues/2421
  SecurityPkg/RandomNumberGenerator/RngDxe/RngDxe.inf
  SecurityPkg/Hash2DxeCrypto/Hash2DxeCrypto.inf

  #
  # Network Support
  #
  !include NetworkPkg/NetworkComponents.dsc.inc

  #
  # Ramdisk support (driver required for network boot native .iso/.img support)
  #
  MdeModulePkg/Universal/Disk/RamDiskDxe/RamDiskDxe.inf

  #
  # QEMU Virtio devices support
  #
  OvmfPkg/VirtioPciDeviceDxe/VirtioPciDeviceDxe.inf
  OvmfPkg/Virtio10Dxe/Virtio10.inf
  OvmfPkg/VirtioBlkDxe/VirtioBlk.inf
  OvmfPkg/VirtioScsiDxe/VirtioScsi.inf
  OvmfPkg/VirtioSerialDxe/VirtioSerial.inf
  OvmfPkg/VirtioGpuDxe/VirtioGpu.inf
  OvmfPkg/VirtioNetDxe/VirtioNet.inf

[LibraryClasses]
  NULL|MdePkg/Library/IntrinsicLib/IntrinsicLib.inf

[PcdsFixedAtBuild]
  gEfiMdePkgTokenSpaceGuid.PcdMaximumAsciiStringLength|0
!if $(TARGET) == RELEASE
  # DEBUG_PRINT_ENABLED
  gEfiMdePkgTokenSpaceGuid.PcdDebugPropertyMask|2
  # DEBUG_ERROR | DEBUG_WARN
  gEfiMdePkgTokenSpaceGuid.PcdDebugPrintErrorLevel|0x80000002
  gEfiMdePkgTokenSpaceGuid.PcdFixedDebugPrintErrorLevel|0x80000002
!else
  # DEBUG_ASSERT_ENABLED | DEBUG_PRINT_ENABLED | DEBUG_CODE_ENABLED | CLEAR_MEMORY_ENABLED | ASSERT_DEADLOOP_ENABLED
  gEfiMdePkgTokenSpaceGuid.PcdDebugPropertyMask|0x2f
  # DEBUG_ERROR | DEBUG_WARN | DEBUG_INFO
  gEfiMdePkgTokenSpaceGuid.PcdDebugPrintErrorLevel|0x80000042
  gEfiMdePkgTokenSpaceGuid.PcdFixedDebugPrintErrorLevel|0x80000042
!endif
  gMaxRegnerPkgTokenSpaceGuid.PcdCanaryAllowRdtscFallback|TRUE

  # ImageLoader settings
  gEfiMdePkgTokenSpaceGuid.PcdImageLoaderRtRelocAllowTargetMismatch|FALSE
  gEfiMdePkgTokenSpaceGuid.PcdImageLoaderHashProhibitOverlap|TRUE
  gEfiMdePkgTokenSpaceGuid.PcdImageLoaderLoadHeader|TRUE
  gEfiMdePkgTokenSpaceGuid.PcdImageLoaderDebugSupport|FALSE
  gEfiMdePkgTokenSpaceGuid.PcdImageLoaderAllowMisalignedOffset|FALSE
  gEfiMdePkgTokenSpaceGuid.PcdImageLoaderRemoveXForWX|TRUE
  gEfiMdePkgTokenSpaceGuid.PcdImageLoaderWXorX|TRUE
  gEfiMdePkgTokenSpaceGuid.PcdImageLoaderAlignmentPolicy|0xFFFFFFFF
  gEfiMdePkgTokenSpaceGuid.PcdImageLoaderRelocTypePolicy|0xFFFFFFFF
  gEfiMdePkgTokenSpaceGuid.PcdImageProtectionPolicy|0x00000003

[PcdsPatchableInModule]
  gEfiMdeModulePkgTokenSpaceGuid.PcdSerialRegisterAccessWidth|8
  gEfiMdeModulePkgTokenSpaceGuid.PcdSerialUseMmio|FALSE
  gEfiMdeModulePkgTokenSpaceGuid.PcdSerialUseHardwareFlowControl|FALSE
  gEfiMdeModulePkgTokenSpaceGuid.PcdSerialDetectCable|FALSE
  gEfiMdeModulePkgTokenSpaceGuid.PcdSerialRegisterBase|0x03F8
  gEfiMdeModulePkgTokenSpaceGuid.PcdSerialBaudRate|115200
  gEfiMdeModulePkgTokenSpaceGuid.PcdSerialLineControl|0x03
  gEfiMdeModulePkgTokenSpaceGuid.PcdSerialFifoControl|0x07
  gEfiMdeModulePkgTokenSpaceGuid.PcdSerialClockRate|1843200
  gEfiMdeModulePkgTokenSpaceGuid.PcdSerialPciDeviceInfo|{0xFF,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
  gEfiMdeModulePkgTokenSpaceGuid.PcdSerialExtendedTxFifoSize|64
  gEfiMdeModulePkgTokenSpaceGuid.PcdSerialRegisterStride|1
  #
  # Network Pcds
  #
  !include NetworkPkg/NetworkFixedPcds.dsc.inc

[BuildOptions]
  # While there are no PCDs as of now, there at least are some custom macros.
  DEFINE OCPKG_BUILD_OPTIONS_GEN = -D DISABLE_NEW_DEPRECATED_INTERFACES $(OCPKG_BUILD_OPTIONS) -D OC_TARGET_$(TARGET)=1
  DEFINE OCPKG_ANAL_OPTIONS_GEN = "-DANALYZER_UNREACHABLE=__builtin_unreachable" "-DANALYZER_NORETURN=__attribute__((noreturn))"

  GCC:DEBUG_*_*_CC_FLAGS        = $(OCPKG_BUILD_OPTIONS_GEN) $(OCPKG_ANAL_OPTIONS_GEN) -fstack-protector-strong -mstack-protector-guard=global -Wuninitialized
  GCC:NOOPT_*_*_CC_FLAGS        = $(OCPKG_BUILD_OPTIONS_GEN) $(OCPKG_ANAL_OPTIONS_GEN) -fstack-protector-strong -mstack-protector-guard=global -Wuninitialized
  GCC:RELEASE_*_*_CC_FLAGS      = $(OCPKG_BUILD_OPTIONS_GEN) $(OCPKG_ANAL_OPTIONS_GEN) -fstack-protector-strong -mstack-protector-guard=global -Wuninitialized
  CLANGPDB:DEBUG_*_*_CC_FLAGS   = $(OCPKG_BUILD_OPTIONS_GEN) $(OCPKG_ANAL_OPTIONS_GEN) -fstack-protector-strong -mstack-protector-guard=global -ftrivial-auto-var-init=pattern
  CLANGPDB:NOOPT_*_*_CC_FLAGS   = $(OCPKG_BUILD_OPTIONS_GEN) $(OCPKG_ANAL_OPTIONS_GEN) -fstack-protector-strong -mstack-protector-guard=global -ftrivial-auto-var-init=pattern
  CLANGPDB:RELEASE_*_*_CC_FLAGS = $(OCPKG_BUILD_OPTIONS_GEN) $(OCPKG_ANAL_OPTIONS_GEN) -fstack-protector-strong -mstack-protector-guard=global -ftrivial-auto-var-init=pattern
  CLANGGCC:DEBUG_*_*_CC_FLAGS   = $(OCPKG_BUILD_OPTIONS_GEN) $(OCPKG_ANAL_OPTIONS_GEN) -fstack-protector-strong -mstack-protector-guard=global -ftrivial-auto-var-init=pattern
  CLANGGCC:NOOPT_*_*_CC_FLAGS   = $(OCPKG_BUILD_OPTIONS_GEN) $(OCPKG_ANAL_OPTIONS_GEN) -fstack-protector-strong -mstack-protector-guard=global -ftrivial-auto-var-init=pattern
  CLANGGCC:RELEASE_*_*_CC_FLAGS = $(OCPKG_BUILD_OPTIONS_GEN) $(OCPKG_ANAL_OPTIONS_GEN) -fstack-protector-strong -mstack-protector-guard=global -ftrivial-auto-var-init=pattern
  MSFT:DEBUG_*_*_CC_FLAGS       = $(OCPKG_BUILD_OPTIONS_GEN) /wd4324 /wd4723 /GS /kernel
  MSFT:NOOPT_*_*_CC_FLAGS       = $(OCPKG_BUILD_OPTIONS_GEN) /wd4324 /wd4723 /GS /kernel
  MSFT:RELEASE_*_*_CC_FLAGS     = $(OCPKG_BUILD_OPTIONS_GEN) /wd4324 /wd4723 /GS /kernel
  XCODE:DEBUG_*_*_CC_FLAGS      = $(OCPKG_BUILD_OPTIONS_GEN) $(OCPKG_ANAL_OPTIONS_GEN) -fstack-protector-strong -ftrivial-auto-var-init=pattern
  XCODE:NOOPT_*_*_CC_FLAGS      = $(OCPKG_BUILD_OPTIONS_GEN) $(OCPKG_ANAL_OPTIONS_GEN) -fstack-protector-strong -ftrivial-auto-var-init=pattern
  XCODE:RELEASE_*_*_CC_FLAGS    = $(OCPKG_BUILD_OPTIONS_GEN) $(OCPKG_ANAL_OPTIONS_GEN) -Oz -flto -fstack-protector-strong -ftrivial-auto-var-init=pattern

  !include NetworkPkg/NetworkBuildOptions.dsc.inc
