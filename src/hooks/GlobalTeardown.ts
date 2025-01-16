import { unlinkSync, readdirSync } from 'fs';
import * as userProfileGeneratedataConfig from '../resources/test_data/user_administration/testdata_generator/user_profile_generate_data_config.json';
import { removeGeneratedTestdatafilesinTeardown } from '../utils/GenerateTestData';

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
  const resultsfolderjson = userProfileGeneratedataConfig.JSON_Properties['json_path'] + '/../';
  removeGeneratedTestdatafilesinTeardown(resultsfolderjson);
  const resultsfolderjsonfaker = userProfileGeneratedataConfig.JSON_Properties['json_path_faker'] + '/../';
  removeGeneratedTestdatafilesinTeardown(resultsfolderjsonfaker);
}
export default globalTeardown;
