   M S B A M L   `   `   `  ����B  >wpfDemo, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:wpfDemowpfDemo  5   	   A%clr-namespace:wpfDemo.UserControlDemowpfDemo.UserControlDemo  5   	       wpfDemo.UnitWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   'localclr-namespace:wpfDemo     5   	   V RMaterialDesignThemes.Wpf, Version=2.5.1.1345, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5
   	   c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5   	   .uc%clr-namespace:wpfDemo.UserControlDemo  5   	   -   5        $��
unitWindow��5   	     � Title$  
UnitWindow��5   	   $	��400��6   $	��700��6)      unitRes � DataContext# [  5	   	     MaterialDesignBody#���  5   	   $��Regular"�5   	   $��13(�5   	   &   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignPaper#���  5   	     MaterialDesignFont#���  5   	    � WindowStartupLocation$ CenterScreen=�5   	    � WindowStyle$
 None=�5   	    � 
ResizeMode$ NoResize=�5   	   .��5      �  � RowDefinitions 5   
   �� 5      $
��auto �6   �� 5      .+�5   
   � .+�5      *   $wpfDemo.UserControlDemo.ControlBarUC  5       � 5!   
   $��1��6    5"      �� 5#      $
��auto �6    �� 5$      $
��auto �6    �� 5%      .+�5'      #  MaterialDesignThemes.Wpf.Card  $��10q�6"   .��5(      �� )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Enter the Unit ��6   $��5q�6L    % !MaterialDesignFloatingHintTextBox#��[ 5)      ��5*      �� *DisplayName+	 �� UpdateSourceTrigger$	 PropertyChanged=�
 �� Mode$
 TwoWay=�5+        5,      $��1��6"   $��5q�6/   .��5-      ��  �� Orientation$ 
Horizontal=�6   .+�5.      ��   MaterialDesignRaisedButton#��[ 5/      $	��100��50      $��10q�6%   ��5.      �� *
AddCommand+.��50   1   Add52      �� 53      #��[ 54      $	��100��55      $��10q�6%   ��53      �� *EditCommand+.��55   1   Edit57      �� 58      #��[ 59      $	��100��5:      $��10q�6%   ��58      �� *DeleteCommand+.��5:   1   Delete5<      5=      5>      � 5?      $��2��6   ��. $
��Auto=�5@      .+�5A        $��Stretch=�6&   .��5B      �� ��6   �� *
ListUnit+$
 TwoWay=� �� SelectedItem 5C      �� *SelectedItem+ �� View 5D      �� 5E      .P�5F   "   �� $��Id��61    �� DisplayMemberBinding 6=   �� *Id+6c   �� 5G   "   $��	Unit Name��61    6D   �� *DisplayName+6s   5H      5J      5K      5L      5N      5O      5P      