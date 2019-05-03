using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using wpfDemo.Model;

namespace wpfDemo.ViewModel
{

    public class MainViewModel : BaseViewModel
    {
        public bool isLoaded = false;
        public ICommand loadedCommand { get; set; }
        public ICommand unitCommand { get; set; }
        public ICommand supplierCommand { get; set; }
        public ICommand customerCommand { get; set; }
        public ICommand objectCommand { get; set; }
        public ICommand userCommand { get; set; }
        public ICommand inputCommand { get; set; }
        public ICommand outputCommand { get; set; }

        private ObservableCollection<Inventory> _inventoryList;
        public ObservableCollection<Inventory> inventoryList{
            get => _inventoryList;
            set {
                _inventoryList = value;
                OnPropertyChanged();
            }
        }
        public MainViewModel()
        {
            loadedCommand = new RelayCommand<Window>((p) => true, (p) =>
            {
                if (p == null) return;
                p.Hide();
                if (!isLoaded)
                {
                    isLoaded = true;
                    LoginWindow loginWindow = new LoginWindow();
                    loginWindow.ShowDialog();
                    var loginVM = loginWindow.DataContext as LoginViewModel;
                    if (loginVM.isLogin)
                    {
                        LoadInventory();
                        p.Show();
                    }
                }
            });
            unitCommand = new RelayCommand<object>((p) => true, (p) => {
                UnitWindow wd = new UnitWindow();
                wd.ShowDialog();
            });
            supplierCommand = new RelayCommand<object>((p) => true, (p) => {
                SupplierWindow wd = new SupplierWindow();
                wd.ShowDialog();
            });
            customerCommand = new RelayCommand<object>((p) => true, (p) => {
                CustomerWindow wd = new CustomerWindow();
                wd.ShowDialog();
            });
            objectCommand = new RelayCommand<object>((p) => true, (p) => {
                ObjectWindow wd = new ObjectWindow();
                wd.ShowDialog();
            });
            userCommand = new RelayCommand<object>((p) => true, (p) => {
                UserWindow wd = new UserWindow();
                wd.ShowDialog();
            });
            inputCommand = new RelayCommand<object>((p) => true, (p) => {
                InputWindow wd = new InputWindow();
                wd.ShowDialog();
            });
            outputCommand = new RelayCommand<object>((p) => true, (p) => {
                OutputWindow wd = new OutputWindow();
                wd.ShowDialog();
            });

            void LoadInventory()
            {
                inventoryList = new ObservableCollection<Inventory>();
                var listObject = DataProvider.Ins.DB.Objects;
                int tmp = 0;
                foreach (var item in listObject)
                {
                    var numberOfObjectFromInput = DataProvider.Ins.DB.InputInfoes.Where(x => x.IdObject == item.Id);
                    var numberOfObjectFromOutput = DataProvider.Ins.DB.OutputInfoes.Where(x => x.IdObject == item.Id);
                    int sumObjectOutput = 0;
                    int sumObjectInput = 0;
                    if (numberOfObjectFromInput != null && numberOfObjectFromInput.Count() >0)
                    {
                        sumObjectInput = (int)numberOfObjectFromInput.Sum(x => x.Count);
                    }
                    if (numberOfObjectFromOutput != null && numberOfObjectFromOutput.Count()>0)
                    {
                        sumObjectOutput = (int)numberOfObjectFromOutput.Sum(x => x.Count);
                    }
                    tmp++;
                    inventoryList.Add(new Inventory() { Object = item, STT = tmp, Count = sumObjectInput - sumObjectOutput });
                }
                
            }
        }
    }
}
