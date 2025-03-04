import AdultsLackingCapacityPage from '../pages/IRAS/questionSet/AdultsLackingCapacityPage';
import BookingPage from '../pages/IRAS/questionSet/BookingPage';
import ChildrenPage from '../pages/IRAS/questionSet/ChildrenPage';
import DevicesPage from '../pages/IRAS/questionSet/DevicesPage';
import ProjectDetailsPage from '../pages/IRAS/questionSet/ProjectDetailsPage';
import ProjectFilterPage from '../pages/IRAS/questionSet/ProjectFilterPage';
import StudentPage from '../pages/IRAS/questionSet/StudentPage';
import TissuePage from '../pages/IRAS/questionSet/TissuePage';

export type PageObjectDataName =
  | { pageObject: ProjectFilterPage; dataName: 'projectFilterPageTestData' }
  | { pageObject: ProjectDetailsPage; dataName: 'projectDetailsPageTestData' }
  | { pageObject: StudentPage; dataName: 'studentPageTestData' }
  | { pageObject: DevicesPage; dataName: 'devicesPageTestData' }
  | { pageObject: TissuePage; dataName: 'tissuePageTestData' }
  | { pageObject: AdultsLackingCapacityPage; dataName: 'adultsLackingCapacityPageTestData' }
  | { pageObject: ChildrenPage; dataName: 'childrenPageTestData' }
  | { pageObject: BookingPage; dataName: 'bookingPageTestData' };
