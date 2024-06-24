import { unlinkSync } from 'fs';
async function globalTeardown() {
  //removing files generated during setup
  unlinkSync('auth-storage-states/contactManagerOnly.json');
}
export default globalTeardown;
