import { registerPlugin } from '@capacitor/core';

import type { ScanPlugin } from './definitions';

const Scan = registerPlugin<ScanPlugin>('Scan');

export * from './definitions';
export { Scan };
