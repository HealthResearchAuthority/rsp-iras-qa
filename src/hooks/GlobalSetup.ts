async function globalSetup() {
    process.env.BASE_URL = 'https://hra-iras2-stg1.pegacloud.net/prweb/PRAuth/HRANewIRAS?AppContext=NewIRAS';
    console.log(process.env.BROWSER);
  }
  export default globalSetup