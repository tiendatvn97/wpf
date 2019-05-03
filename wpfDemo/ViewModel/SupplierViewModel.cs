using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using wpfDemo.Model;

namespace wpfDemo.ViewModel
{
    public class SupplierViewModel :BaseViewModel
    {
        private ObservableCollection<Supplier> _List;
        public ObservableCollection<Supplier> List
        {
            get => _List;
            set
            {
                _List = value;
                OnPropertyChanged();
            }
        }

        private string _DisplayName;
        public string DisplayName { get => _DisplayName;set{_DisplayName = value; OnPropertyChanged();} }

        private string _Address;
        public string Address { get => _Address; set { _Address = value; OnPropertyChanged(); } }

        private string _Phone;
        public string Phone { get => _Phone; set { _Phone = value; OnPropertyChanged(); } }

        private string _Email;
        public string Email { get => _Email; set { _Email = value; OnPropertyChanged(); } }

        private string _MoreInfo;
        public string MoreInfo { get => _MoreInfo; set { _MoreInfo = value; OnPropertyChanged(); } }

        private DateTime? _ContactDate;
        public DateTime? ContactDate { get => _ContactDate; set { _ContactDate = value; OnPropertyChanged(); } }


        private Supplier _SelectedItem;
        public Supplier SelectedItem
        {
            get => _SelectedItem;
            set
            {
                _SelectedItem = value;
                OnPropertyChanged();
                if (SelectedItem != null)
                {
                    DisplayName = SelectedItem.DisplayName;
                    Address = SelectedItem.Address; 
                    Phone = SelectedItem.Phone; 
                    Email = SelectedItem.Email; 
                    MoreInfo = SelectedItem.MoreInfo; 
                    ContactDate = SelectedItem.ContactDate; 
                }
            }
        }
        public ICommand AddCommand { get; set; }
        public ICommand EditCommand { get; set; }

        public SupplierViewModel()
        {
            List = new ObservableCollection<Supplier>(DataProvider.Ins.DB.Suppliers);
            AddCommand = new RelayCommand<object>((p) => true, (p) => {
                    string displayName = DisplayName;
                    Supplier supplier = new Supplier() { DisplayName = displayName, Address= Address, Email = Email,
                    MoreInfo = MoreInfo, ContactDate = ContactDate, Phone = Phone};
                    DataProvider.Ins.DB.Suppliers.Add(supplier);
                    DataProvider.Ins.DB.SaveChanges();
                    List.Add(supplier);

               
            });

            EditCommand = new RelayCommand<object>((p) => true, (p) => {
                if (SelectedItem != null)
                {
                    var supplier = DataProvider.Ins.DB.Suppliers.Where(x => x.Id == SelectedItem.Id).SingleOrDefault();
                    if (supplier != null)
                    {
                        supplier.DisplayName = DisplayName;
                        supplier.Address = Address;
                        supplier.Email = Email;
                        supplier.MoreInfo = MoreInfo;
                        supplier.ContactDate = ContactDate;
                        supplier.Phone = Phone;
                        DataProvider.Ins.DB.SaveChanges();
                        SelectedItem.DisplayName = DisplayName;
                    }
                }
            });
        }
    }
}
