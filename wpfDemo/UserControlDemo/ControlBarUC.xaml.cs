using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using wpfDemo.ViewModel;

namespace wpfDemo.UserControlDemo
{
    /// <summary>
    /// Interaction logic for ControlBarUC.xaml
    /// </summary>
   
    public partial class ControlBarUC : UserControl
    {
        public ControlBarViewModel ControlBarVM { get; set; }
        public ControlBarUC()
        {
            InitializeComponent();
            this.DataContext = ControlBarVM = new ControlBarViewModel();
        }
    }
}
