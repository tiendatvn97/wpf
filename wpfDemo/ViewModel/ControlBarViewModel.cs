using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using wpfDemo.UserControlDemo;

namespace wpfDemo.ViewModel
{
   
    public class ControlBarViewModel:BaseViewModel
    {
        public ICommand closeCommand { get; set; }
        public ICommand maximizeCommand { get; set; }
        public ICommand minimizeCommand { get; set; }
        public ICommand MouseMoveCommand { get; set; }
        public ControlBarViewModel()
        {
            
            closeCommand = new RelayCommand<ControlBarUC>((p) => true, (p) => {
                Window window = getWindowParent(p) as Window;
                if (window != null) window.Close();
            });
            maximizeCommand = new RelayCommand<ControlBarUC>((p) => true, (p) => {
                Window window = getWindowParent(p) as Window;
                if (window != null )
                {
                    if (window.WindowState == WindowState.Maximized)
                    {
                        window.WindowState = WindowState.Normal;
                    }
                    else window.WindowState = WindowState.Maximized;
                }
            });
            minimizeCommand = new RelayCommand<ControlBarUC>((p) => true, (p) => {
                Window window = getWindowParent(p) as Window;
                if (window != null)
                {
                    if (window.WindowState == WindowState.Minimized)
                    {
                        window.WindowState = WindowState.Normal;
                    }
                    else window.WindowState = WindowState.Minimized;
                }
            });

            MouseMoveCommand = new RelayCommand<ControlBarUC>((p) => true, (p) => {
                Window window = getWindowParent(p) as Window;
                if (window != null)
                {
                    window.DragMove();
                }
            });

            FrameworkElement getWindowParent(FrameworkElement p)
        {
            while (p.Parent != null)
            {
                p = p.Parent as FrameworkElement;
            }
                return p;
        }
    }
        
    }
}
