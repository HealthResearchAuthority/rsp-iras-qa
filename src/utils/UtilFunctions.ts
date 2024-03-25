
export function getAuthState(user: string): string {
    let authState: string
    switch (user.toLowerCase()) {
      case 'poc':
        authState = 'auth-storage-states/contactManagerOnly.json';
        break;
      default:
        throw new Error(`${user} is not a valid option`);
    }
    return authState
  }

  export function confirmStringNotNull(inputString: string | null): string {
    if (inputString != null) {
      return inputString.trim();
    } else {
      throw new Error(`The input string is null`);
    }
  }