import { unlinkSync, readdirSync } from 'fs';
async function globalTeardown() {
  // removing files generated during setup
  try {
    const files = readdirSync('auth-storage-states/');
    for (const file of files) {
      unlinkSync(`auth-storage-states/${file}`);
    }
  } catch (err) {
    console.error(err);
  }
}
export default globalTeardown;
