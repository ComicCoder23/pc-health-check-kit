import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const pack = path.join(root, 'release/Mum PC Helper v1');
const required = [
  'Master Index', 'First Visit Checklist', 'What To Ask Mum', 'Session Notes',
  'Results Interpretation Guide', 'Browser Triage Guide',
];
for (const title of required) {
  const name = `Mum PC Helper - ${title}.md`;
  const directory = title === 'Master Index' ? '01 Start Here' : '03 User Guide';
  const bundled = path.join(pack, directory, name);
  assert.ok(fs.existsSync(bundled), `Referenced guide missing: ${name}`);
  if (title !== 'Master Index') {
    assert.deepEqual(fs.readFileSync(bundled), fs.readFileSync(path.join(root, 'build', name)),
      `Existing guide changed while packaging: ${name}`);
  }
}
const index = fs.readFileSync(path.join(pack, '01 Start Here/Mum PC Helper - Master Index.md'), 'utf8');
for (const match of index.matchAll(/\]\(<([^>]+)>\)/g)) {
  assert.ok(fs.existsSync(path.resolve(pack, '01 Start Here', match[1])), `Broken pack index link: ${match[1]}`);
}
assert.ok(fs.existsSync(path.join(pack, '04 Scripts/ReportPrivacy.ps1')));
console.log('PASS: six referenced guides bundled, existing guide bytes preserved, index links resolve, privacy helper present. No audit executed.');
