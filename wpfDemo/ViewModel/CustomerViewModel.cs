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
    public class CustomerViewModel :BaseViewModel
    {
        private ObservableCollection<Customer> _List;
        public ObservableCollection<Customer> List
        {
            get => _List;
            set
            {
                _List = value;
                OnPropertyChanged();
            }
        }

        private string _DisplayName;
        public string DisplayName { get => _DisplayName; set { _DisplayName = value; OnPropertyChanged(); } }

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


        private Customer _SelectedItem;
        public Customer SelectedItem
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

        public CustomerViewModel()
        {
            List = new ObservableCollection<Customer>(DataProvider.Ins.DB.Customers);
            AddCommand = new RelayCommand<object>((p) => true, (p) => {
                string displayName = DisplayName;
                Customer customer = new Customer()
                {
                    DisplayName = displayName,
                    Address = Address,
                    Email = Email,
                    MoreInfo = MoreInfo,
                    ContactDate = ContactDate,
                    Phone = Phone
                };
                DataProvider.Ins.DB.Customers.Add(customer);
                DataProvider.Ins.DB.SaveChanges();
                List.Add(customer);


            });

            EditCommand = new RelayCommand<object>((p) => true, (p) => {
                if (SelectedItem != null)
                {
                    var customer = DataProvider.Ins.DB.Customers.Where(x => x.Id == SelectedItem.Id).SingleOrDefault();
                    if (customer != null)
                    {
                        customer.DisplayName = DisplayName;
                        customer.Address = Address;
                        customer.Email = Email;
                        customer.MoreInfo = MoreInfo;
                        customer.ContactDate = ContactDate;
                        customer.Phone = Phone;
                        DataProvider.Ins.DB.SaveChanges();
                        SelectedItem.DisplayName = DisplayName;
                    }
                }
            });
        }
    }
}
