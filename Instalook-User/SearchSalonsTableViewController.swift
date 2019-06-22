import UIKit

enum scopedSelected: Int{
    case Name = 0
    case Location = 1
}

class SearchSalonsTableViewController: UITableViewController, UISearchBarDelegate {
    
    // MARK: - properties
    var presenter : SearchPreseneter!
    private var searchController = UISearchController()
    private var resultsController = UITableViewController()
    let activityView = UIActivityIndicatorView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = SearchPreseneter(view: self)
        presenter.getSalons()
        
        // Activity Indicator configuration
        activityIndicatorSetup()
        
        // Search Configuration
        searchBarSetup()
        
        // TableView height configuration
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        // TableView row height configuration
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 118
        
    }
    
    func activityIndicatorSetup(){
        activityView.center =  self.view.center
        activityView.hidesWhenStopped = true
        activityView.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        self.view.addSubview(activityView)
    }
    
    func searchBarSetup(){
        let searchBar = UISearchBar(frame: CGRect(x: 0,y: 0, width:(UIScreen.main.bounds.width), height: 70))
        searchBar.showsScopeBar = true
        searchBar.scopeButtonTitles =  ["Name", "location"]
        searchBar.barStyle = UIBarStyle.black
        searchBar.selectedScopeButtonIndex = 0
        searchBar.delegate = self
        self.tableView.tableHeaderView = searchBar
        
    }
    
    // MARK: - search bar delegete
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty{
            presenter.getSalons()
        } else{
            filterTable(index: searchBar.selectedScopeButtonIndex, text: searchText)
        }
    }
    
    func filterTable(index: Int, text: String){
        switch index{
        case scopedSelected.Name.rawValue:
            presenter.filterByName(text: text)
        case scopedSelected.Location.rawValue:
            presenter.filterByLocation(text: text)
        default:
            print("nothing")
        }
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getSalonsCount()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "SalonTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! SalonTableViewCell
        
        //configure cell
        presenter.configureCell(cell: cell, index: indexPath.row)
        return cell
    }
    
}

// MARK: - extension
extension SearchSalonsTableViewController: SearchView{
    
    func showIndicator(){
        activityView.startAnimating()
    }
    func hideIndicator(){
        activityView.stopAnimating()
    }
    func fetchingDataSuccess(){
        print("fetchingDataSuccess")
    }
    func showError(error: String?){
        let alert = UIAlertController(title: "Error", message: "\(error!)", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Reload", style: UIAlertActionStyle.default, handler: {(action: UIAlertAction!) in
            self.presenter.getSalons()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func reloadData() {
        tableView.reloadData()
    }
    
}
