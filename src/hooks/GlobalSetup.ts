async function globalSetup() {
  //Pre-prod url
  process.env.BASE_URL = 'https://fd-rsp-applications-preprod-uks-f6esbkgtfncwc4gf.a03.azurefd.net/';
  // ST Automation URl
  // process.env.BASE_URL = 'https://fd-rsp-applications-automationtest-uks-e7f6hkg3c5edhxex.a03.azurefd.net/';
  // prod url
  // process.env.BASE_URL = 'https://fd-rsp-applications-prod-uks-dqa3dydwg4h6f6dp.a02.azurefd.net/';
}
export default globalSetup;
export const deviceDSafari = 'Desktop Safari';
export const deviceDFirefox = 'Desktop Firefox';
export const deviceDChrome = 'Desktop Chrome';
export const deviceDEdge = 'Desktop Edge';
