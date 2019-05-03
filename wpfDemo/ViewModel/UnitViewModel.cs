﻿using System;
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
    
    public class UnitViewModel :BaseViewModel
    {
        private ObservableCollection<Unit> _ListUnit;
        public ObservableCollection<Unit> ListUnit
        {
            get => _ListUnit;
            set
            {
                _ListUnit = value;
                OnPropertyChanged();
            }
        }

        private string _DisplayName;
        public string DisplayName
        {
            get => _DisplayName;
            set
            {
                _DisplayName = value;
                OnPropertyChanged();
            }
        }

        private Unit _SelectedItem;
        public Unit SelectedItem
        {
            get => _SelectedItem;
            set
            {
                _SelectedItem = value;
                OnPropertyChanged();
                if (SelectedItem != null)
                {
                    DisplayName = SelectedItem.DisplayName;
                }
            }
        }
        public ICommand AddCommand { get; set; }
        public ICommand EditCommand { get; set; }

        public UnitViewModel()
        {
            ListUnit = new ObservableCollection<Unit>(DataProvider.Ins.DB.Units);
            AddCommand = new RelayCommand<object>((p) =>true, (p) => {
                if (DisplayName != "")
                {
                    string displayName = DisplayName;
                    Unit unit = new Unit() { DisplayName = displayName };
                    DataProvider.Ins.DB.Units.Add(unit);
                    DataProvider.Ins.DB.SaveChanges();
                    ListUnit.Add(unit);

                }
            });

            EditCommand = new RelayCommand<object>((p) => true, (p) => {
                if (SelectedItem != null)
                {
                    var unit =  DataProvider.Ins.DB.Units.Where(x => x.Id == SelectedItem.Id).SingleOrDefault();
                    if (unit != null)
                    {
                        unit.DisplayName = DisplayName;
                        DataProvider.Ins.DB.SaveChanges();
                        SelectedItem.DisplayName = DisplayName;
                    }
                }
            });
            }
    }
}
