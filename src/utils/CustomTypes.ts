import AdultsLackingCapacityPage from '../pages/IRAS/AdultsLackingCapacityPage';
import DevicesPage from '../pages/IRAS/DevicesPage';
import ProjectDetailsPage from '../pages/IRAS/ProjectDetailsPage';
import ProjectFilterPage from '../pages/IRAS/ProjectFilterPage';
import StudentPage from '../pages/IRAS/StudentPage';
import TissuePage from '../pages/IRAS/TissuePage';

export type PageObjectDataName =
  | { pageObject: ProjectFilterPage; dataName: 'projectFilterPageTestData' }
  | { pageObject: ProjectDetailsPage; dataName: 'projectDetailsPageTestData' }
  | { pageObject: DevicesPage; dataName: 'devicesPageTestData' }
  | { pageObject: TissuePage; dataName: 'tissuePageTestData' }
  | { pageObject: StudentPage; dataName: 'studentPageTestData' }
  | { pageObject: AdultsLackingCapacityPage; dataName: 'adultsLackingCapacityPageTestData' };
