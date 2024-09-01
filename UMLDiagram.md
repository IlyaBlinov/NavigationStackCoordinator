# UMLDiagram

@startuml

protocol ObservableObject {
    + objectWillChange: Self.ObjectWillChangePublisher { get }
}

protocol Hashable {}

class TabBarNavigaton {
	selectedTabIndex: Int
}



protocol ITabBarManager {
	setSelectedIndex(index: Int)
}

class TabBarManager {
	- tabBarNavigaton: TabBarNavigaton
    + init(tabBarNavigaton: TabBarNavigaton)
	+ setSelectedIndex(index: Int)
}

class Navigation {
	+ path: NavigationPath
	+ sheet: AnyHashable?
	+ fullScreenCover: AnyHashable?
}

protocol INavigationManager {
	push<T: Hashable>(_ value: T)
	showSheet(_ sheet: AnyHashable)
	hideSheet()
	showFullScreenCover(_ fullScreenCover: AnyHashable)
	hideFullScreenCover()
}

class NavigationManager  {
	- navigation: Navigation
    + init(navigation: Navigation)
	+ push<T: Hashable>(_ value: T)
	+ showSheet(_ sheet: AnyHashable)
	+ hideSheet()
	+ showFullScreenCover(_ fullScreenCover: AnyHashable)
	+ hideFullScreenCover()
}

class MainContainer {
	+ tabBarNavigaton = TabBarNavigaton()
	+ firstTabNavigation = Navigation()
	+ secondTabNavigation = Navigation()
	+ thirdTabNavigation = Navigation()

}

protocol IAppCoordinatorAssembly {
    + assemblyDeeplinkCoordinator() -> DeeplinkCoordinator
	+ assemblyMainView() -> MainView
}

class AppCoordinatorAssembly {
    + coordinator: AppCoordinator
	- mainContainer: MainContainer
    + init(mainContainer: MainContainer)
    - assemblyFirstTabCoordinator() -> FirstTabCoordinator
    - assemblySecondTabCoordinator() -> SecondTabCoordinator
    - assemblyThirdTabCoordinator() -> ThirdTabCoordinator
    - assemblyFirstTabCoordinatorView() -> FirstTabNavigationView<FirstTabView>
    - assemblySecondTabCoordinatorView() -> SecondTabNavigationView<SecondTabView>
    - assemblyThirdTabCoordinatorView() -> ThirdTabNavigationView<ThirdTabView>
    + assemblyDeeplinkCoordinator() -> DeeplinkCoordinator
	+ assemblyMainView() -> MainView
}

class AppCoordinator {
	- assembly: IAppCoordinatorAssembly
	- id: UUID
	+ view() -> some View
}

struct NavigationStackCoordinatorApp {
    - appCoordinator: AppCoordinator
    - deeplinkCoordinator: DeeplinkCoordinator
    + body: some Scene
}


protocol IFirstTabCoordinator {
	+ showFirstFlowCoordinator()
}

class FirstTabCoordinator {
	- navigationManager: INavigationManager
	- tabBarManager: ITabBarManager
	- assembly: IFirstTabCoordinatorAssembly
    + init(navigationManager: INavigationManager,tabBarManager: ITabBarManager, assembly: IFirstTabCoordinatorAssembly)
	+ showFirstFlowCoordinator()
}

protocol IFirstTabCoordinatorAssembly {
    + assemblyFirstTabView(model: FirstTabViewModel.SceneInput) -> FirstTabView
	+ assemblyFirstFlowCoordinator(page: FirstFlowCoordinator.Page, navigationManager: INavigationManager, tabBarManager: ITabBarManager) -> FirstFlowCoordinator
}

class FirstTabCoordinatorAssembly {
	+ coordinator: IFirstTabCoordinator
    + assemblyFirstTabView(model: FirstTabViewModel.SceneInput) -> FirstTabView
	+ assemblyFirstFlowCoordinator(page: FirstFlowCoordinator.Page, navigationManager: INavigationManager, tabBarManager: ITabBarManager) -> FirstFlowCoordinator
}

struct FirstTabNavigationView<R: View> {
	- navigation: Navigation
	- sheet: AnyHashable?
	- fullScreenCover: AnyHashable?
	- rootView: R
    + init(navigation: Navigation, rootView: R)
    + body: some View
}

struct MainView {
	- tabBarNavigation: TabBarNavigaton
	- firstTabView: View
	- secondTabView: View
	- thirdTabView: View
    + body: some View
}


protocol IFirstFlowCoordinatorAssembly {
	+ assemblyViewInt(_ model: ViewIntModel.SceneInput) -> ViewInt
	+ assemblyViewDouble(_ model: ViewDoubleModel.SceneInput) -> ViewDouble
	+ assemblyString(_ model: ViewStringModel.SceneInput) -> ViewString
	+ assemblySheetCoordinator(sheet: FirstFlowSheetCoordinator.Sheet) -> FirstFlowSheetCoordinator
	+ assemblyFullScreenCoverCoordinator(fullScreenCover: FirstFlowFullScreenCoverCoordinator.FullScreenCover) -> FirstFlowFullScreenCoverCoordinator
	+ assemblySecondFlowCoordinator(page: SecondFlowCoordinator.Page, navigationManager: INavigationManager, tabBarManager: ITabBarManager) -> SecondFlowCoordinator
}

class FirstFlowCoordinatorAssembly {
    + coordinator: IFirstFlowCoordinator
    + assemblyViewInt(_ model: ViewIntModel.SceneInput) -> ViewInt
	+ assemblyViewDouble(_ model: ViewDoubleModel.SceneInput) -> ViewDouble
	+ assemblyString(_ model: ViewStringModel.SceneInput) -> ViewString
	+ assemblySheetCoordinator(sheet: FirstFlowSheetCoordinator.Sheet) -> FirstFlowSheetCoordinator
	+ assemblyFullScreenCoverCoordinator(fullScreenCover: FirstFlowFullScreenCoverCoordinator.FullScreenCover) -> FirstFlowFullScreenCoverCoordinator
	+ assemblySecondFlowCoordinator(page: SecondFlowCoordinator.Page, navigationManager: INavigationManager, tabBarManager: ITabBarManager) -> SecondFlowCoordinator
}

protocol IFirstFlowCoordinator {
    + showViewString()
	+ showViewInt()
    + showViewDouble()
    + showSecondFlowCoordinatorView()
    + selectNewTab(index: Int)
    + showFirstSheet()
    + dismissSheet()
    + showLoader()
    + hideLoader()
}


    enum FirstFlowCoordinator_Page {
            viewInt
            viewString
            viewDouble
    }

    class FirstFlowCoordinator  {
        - navigationManager: INavigationManager
        - assembly: IFirstFlowCoordinatorAssembly
        - id: UUID
        - tabBarManager: ITabBarManager
        + page: Page
        + showViewString()
	    + showViewInt()
	    + showViewDouble()
	    + showSecondFlowCoordinatorView()
	    + selectNewTab(index: Int)
	    + showFirstSheet()
	    + dismissSheet()
	    + showLoader()
	    + hideLoader()
    
}

struct NavigationStack {
    + rootView: View
    + path: NavigationPath
    + navigationDestination(for: FirstFlowCoordinator.self)
}

struct FirstTabRootView {
    + body: some View
    + pushNextScreen()
}

protocol IFirstTabViewOutput {
    + pushNextScreen()
}

class FirstTabOutput {
    - coordinator: IFirstTabCoordinator
    + pushNextScreen()
}


protocol IDeeplinkHandler {
	+ canOpenURL(url: URL) -> Bool
	+ openURL(url: URL)
}

protocol IDeeplinkCoordinator {
	+ handlers: [IDeeplinkHandler]
	+ handleURL(url: URL) -> Bool
}




protocol IDeeplinkCoordinatorAssembly {
	+ assemblyDeeplinkHandlers() -> [IDeeplinkHandler]
}

class DeeplinkCoordinatorAssembly {
	- mainContainer: MainContainer
    - assemblyFirstTabHandlers() -> [IDeeplinkHandler]
	- assemblySecondTabHandlers() -> [IDeeplinkHandler]
	+ assemblyDeeplinkHandlers() -> [IDeeplinkHandler]
}

class DeeplinkCoordinator {
	- assembly: IDeeplinkCoordinatorAssembly
    + handlers: [IDeeplinkHandler]
	+ handleURL(url: URL) -> Bool
}


ObservableObject <|-- Navigation 
ObservableObject <|-- TabBarNavigaton

ITabBarManager<|..TabBarManager 
TabBarManager<--TabBarNavigaton

INavigationManager<|..NavigationManager 
NavigationManager<--Navigation

MainContainer<-- Navigation
MainContainer<--TabBarNavigaton
MainView<--TabBarNavigaton

AppCoordinator<--IAppCoordinatorAssembly
AppCoordinatorAssembly o--MainContainer
AppCoordinatorAssembly<--AppCoordinator

NavigationStackCoordinatorApp*--AppCoordinator
NavigationStackCoordinatorApp*--DeeplinkCoordinator
NavigationStackCoordinatorApp*--MainView
MainView<--AppCoordinatorAssembly


IDeeplinkCoordinator<--IDeeplinkHandler
IDeeplinkCoordinator<|..DeeplinkCoordinator
IDeeplinkCoordinatorAssembly<|..DeeplinkCoordinatorAssembly
DeeplinkCoordinator<--IDeeplinkCoordinatorAssembly
DeeplinkCoordinator<--IDeeplinkHandler
DeeplinkCoordinatorAssembly o--MainContainer

IFirstTabCoordinator<|..FirstTabCoordinator
FirstTabCoordinator<--INavigationManager
FirstTabCoordinator<--ITabBarManager
FirstTabCoordinator<--FirstTabCoordinatorAssembly

IFirstTabCoordinatorAssembly<--FirstTabCoordinator
IFirstTabCoordinatorAssembly<|..FirstTabCoordinatorAssembly
FirstTabCoordinator<--AppCoordinatorAssembly


MainView<--FirstTabNavigationView
FirstTabNavigationView*--NavigationStack
FirstTabNavigationView<--Navigation
FirstTabNavigationView<--FirstTabRootView

IFirstTabViewOutput <|.. FirstTabOutput
FirstTabOutput <-- IFirstTabCoordinator
FirstTabRootView <-- IFirstTabViewOutput


IFirstFlowCoordinator<|..FirstFlowCoordinator
Hashable<|..FirstFlowCoordinator
FirstFlowCoordinator<--INavigationManager
FirstFlowCoordinator<--ITabBarManager
FirstFlowCoordinator<--IFirstFlowCoordinatorAssembly
FirstFlowCoordinatorAssembly<--FirstFlowCoordinator
IFirstFlowCoordinatorAssembly<|..FirstFlowCoordinatorAssembly
FirstFlowCoordinator*--FirstFlowCoordinator_Page
NavigationStack<--FirstFlowCoordinator

