using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using wpfDemo.Model;

namespace wpfDemo.ViewModel
{
    
    public class LoginViewModel :BaseViewModel
    {
        public bool isLogin { get; set; }
        private string _passWord;
        public string passWord
        {
            get => _passWord;
            set { _passWord = value; OnPropertyChanged(); }
        }

        private string _userName; 
        public string userName
        {
            set {
                _userName = value;
                OnPropertyChanged();
            }
            get
            {
                return _userName;
            }
        }
        public ICommand loginCommand { get; set; }
        public ICommand passWordChangedCommand { get; set; }
        public ICommand exitCommand { get; set; }

        public LoginViewModel()
        {
            userName = "";
            passWord = "";
            isLogin = false;
            loginCommand = new RelayCommand<Window>((p) => true, (p) => {
                if (p == null) return;
                Login(p);
            });
            void Login(Window wd)
            {
                int accCount = 0;
                accCount = (DataProvider.Ins.DB.Users.Where(x => x.UserName == userName && x.Password == passWord ).Count());
                if (accCount > 0) {
                    isLogin = true;
                    wd.Close();
                }
                else
                {
                    MessageBox.Show("UserName or PassWord is not Correct");
                }
                
            }

            passWordChangedCommand = new RelayCommand<PasswordBox>((p) => true, (p) =>
             {
                 if (p == null) return;
                 passWord = p.Password;
             });

            exitCommand = new RelayCommand<Window>((p) => true, (p) =>
            {
                if (p == null) return;
                p.Close();
            });


        }
    }
}
