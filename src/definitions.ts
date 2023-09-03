export interface ScanPlugin {
  /**
   * Returns the maximum number of MB that can be used by the engine.
   */
  getMaxMemory(): Promise<{ value: number }>
  /**
   * Returns CPU architecture.
   * Possible values are: armeabi, armeabi-v7a, arm64-v8a, x86, x86_64, mips, mips64.
   */
  getCPUArch(): Promise<{ value: string }>
  /**
   * Initialize the engine. You must call this method before sending commands.
   */
  start(options: { variant: string }): Promise<void>
  /**
   * Sends a command to the engine. You can listen to the output using the
   * "scan" window event.
   */
  cmd(options: { cmd: string }): Promise<void>
  /**
   * Stops the engine.
   */
  exit(): Promise<void>
}
