import AdultsLackingCapacityPage from '../pages/IRAS/AdultsLackingCapacityPage';
import BookingPage from '../pages/IRAS/BookingPage';
import ChildrenPage from '../pages/IRAS/ChildrenPage';
import DevicesPage from '../pages/IRAS/DevicesPage';
import ProjectDetailsPage from '../pages/IRAS/ProjectDetailsPage';
import ProjectFilterPage from '../pages/IRAS/ProjectFilterPage';
import StudentPage from '../pages/IRAS/StudentPage';
import TissuePage from '../pages/IRAS/TissuePage';

export type PageObjectDataName =
  | { pageObject: ProjectFilterPage; dataName: 'projectFilterPageTestData' }
  | { pageObject: ProjectDetailsPage; dataName: 'projectDetailsPageTestData' }
  | { pageObject: StudentPage; dataName: 'studentPageTestData' }
  | { pageObject: DevicesPage; dataName: 'devicesPageTestData' }
  | { pageObject: TissuePage; dataName: 'tissuePageTestData' }
  | { pageObject: AdultsLackingCapacityPage; dataName: 'adultsLackingCapacityPageTestData' }
  | { pageObject: ChildrenPage; dataName: 'childrenPageTestData' }
  | { pageObject: BookingPage; dataName: 'bookingPageTestData' };
