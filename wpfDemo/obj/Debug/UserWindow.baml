   M S B A M L   `   `   `  ����B  >wpfDemo, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:wpfDemowpfDemo  5   	   A%clr-namespace:wpfDemo.UserControlDemowpfDemo.UserControlDemo  5   	       wpfDemo.UserWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   'localclr-namespace:wpfDemo     5   	   V RMaterialDesignThemes.Wpf, Version=2.5.1.1345, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5
   	   c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5   	   .uc%clr-namespace:wpfDemo.UserControlDemo  5   	   -   5        $��
userWindow��5   	     � Title$  
userWindow��5   	   $	��400��6   $	��700��6)      MaterialDesignBody#���   5   	   $��Regular"�5   	   $��13(�5   	   &   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignPaper#���  5   	     MaterialDesignFont#���  5   	    � WindowStartupLocation$ CenterScreen=�5   	    � WindowStyle$
 None=�5   	    � 
ResizeMode$ NoResize=�5   	   .��5      �  � RowDefinitions 5   
   �� 5      $
��auto �6   �� 5      .+�5   
   � .+�5      *   $wpfDemo.UserControlDemo.ControlBarUC  5       � 5!   
   $��1��6    5"      �� 5#      $
��auto �6    �� 5$      $
��auto �6    �� 5%      .+�5'      #  MaterialDesignThemes.Wpf.Card  $��10q�6"   .��5(      � $��5q�6   .+�5)      �� )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ 	Username ��6   $��5 5 15 5q�6J    % !MaterialDesignFloatingHintTextBox#��[ 5*      ��5+      �� *
UserName+ �� UpdateSourceTrigger$ PropertyChanged=��� 5,      $
 Role��6   	 �� 
IsEditable	 .  & "MaterialDesignFloatingHintComboBox#��[ 5-      ��5.      �� *Role+$ PropertyChanged=�
 �� SelectedItem
 5/      �� *SelectedRole+ �� Mode$ TwoWay=��� 50      $ Display Name��6   $��5 5 15 5q�6M   #��[ 51      ��52      �� *DisplayName+$ PropertyChanged=�53      55        56      $��1��6"   $��5q�6/   .��57      ��  �� Orientation$ 
Horizontal=�6   .+�58      ��   MaterialDesignRaisedButton#��[ 59      $	��100��5:      $��10q�6%   ��58      �� *
AddCommand+.��5:   1   Add5<      �� 5=      #��[ 5>      $	��100��5?      $��10q�6%   ��5=      �� *
EdiCommand+.��5?   1   Edit5A      �� 5B      #��[ 5C      $	��100��5D      $��10q�6%   ��5B      �� *DeleteCommand+.��5D   1   Delete5F      5G      5H      � 5I      $��2��6   ��. $
��Auto=�5J      .+�5K        $��Stretch=�6&   .��5L      �� ��6   �� *list+ �� View 5M      �� 5N      .P�5O   "   �� $��Id��61    �� DisplayMemberBinding 6=   �� *Id+6c   �� 5P   "   $��UserName��61    6C   �� *
UserName+6o   �� 5Q   "   $��Position��61    6C   �� *Role.DiplayName+6v   �� 5R   "   $��Display Name��61    6G   �� *DisplayName+6v   5S      5U      5V      5W      5Y      5Z      5[      