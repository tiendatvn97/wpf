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
    public class ObjectViewModel :BaseViewModel
    {
        private ObservableCollection<Model.Object> _List;
        public ObservableCollection<Model.Object> List
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

        private ObservableCollection<Unit> _ListUnit;
        public ObservableCollection<Unit> ListUnit { get => _ListUnit; set { _ListUnit = value; OnPropertyChanged(); } }

        private ObservableCollection<Supplier> _ListSupplier;
        public ObservableCollection<Supplier> ListSupplier { get => _ListSupplier; set { _ListSupplier = value; OnPropertyChanged(); } }


        private string _Address;
        public string Address { get => _Address; set { _Address = value; OnPropertyChanged(); } }

        private string _QRCode;
        public string QRCode { get => _QRCode; set { _QRCode = value; OnPropertyChanged(); } }

        private string _BarCode;
        public string BarCode { get => _BarCode; set { _BarCode = value; OnPropertyChanged(); } }

        private Unit _SelectedUnit;
        public Unit SelectedUnit { get => _SelectedUnit; set { _SelectedUnit = value; OnPropertyChanged(); } }

        private Supplier _SelectedSupplier;
        public Supplier SelectedSupplier { get => _SelectedSupplier; set { _SelectedSupplier = value; OnPropertyChanged(); } }


        private Model.Object _SelectedItem;
        public Model.Object SelectedItem
        {
            get => _SelectedItem;
            set
            {
                _SelectedItem = value;
                OnPropertyChanged();
                if (SelectedItem != null)
                {
                    DisplayName = SelectedItem.DisplayName;
                    SelectedUnit = SelectedItem.Unit;
                    SelectedSupplier = SelectedItem.Supplier;
                    QRCode = SelectedItem.QRCode;
                    BarCode = SelectedItem.BarCode;
                }
            }
        }
        public ICommand AddCommand { get; set; }
        public ICommand EditCommand { get; set; }

        public ObjectViewModel()
        {
            ListUnit = new ObservableCollection<Unit>(DataProvider.Ins.DB.Units);
            ListSupplier = new ObservableCollection<Supplier>(DataProvider.Ins.DB.Suppliers);
            List = new ObservableCollection<Model.Object>(DataProvider.Ins.DB.Objects);
                
            AddCommand = new RelayCommand<object>((p) => true, (p) => {
                string displayName = DisplayName;
                Model.Object obj = new Model.Object()
                {
                    Id = Guid.NewGuid().ToString(),
                    DisplayName = displayName,
                    IdUnit = SelectedUnit.Id,
                    IdSupplier = SelectedUnit.Id,
                    QRCode = QRCode,
                    BarCode = BarCode
                };
                if (obj.Supplier != null && obj.Unit != null)
                {
                    DataProvider.Ins.DB.Objects.Add(obj);
                    DataProvider.Ins.DB.SaveChanges();
                    List.Add(obj);
                }
                
            });

            EditCommand = new RelayCommand<object>((p) => true, (p) => {
                if (SelectedItem != null)
                {
                    var obj = DataProvider.Ins.DB.Objects.Where(x => x.Id == SelectedItem.Id).SingleOrDefault();
                    if (obj != null)
                    {
                        obj.DisplayName = DisplayName;
                        obj.IdUnit = SelectedUnit.Id;
                        obj.IdSupplier = SelectedSupplier.Id;
                        obj.QRCode = QRCode;
                        obj.BarCode = BarCode;
                        DataProvider.Ins.DB.SaveChanges();
                    }
                }
            });
        }
    }
}
