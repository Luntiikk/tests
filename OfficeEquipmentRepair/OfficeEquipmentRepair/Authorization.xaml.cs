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

namespace OfficeEquipmentRepair
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }
        int identity;
        private void btAuthorization_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if(tbLogin.Text == "" | pbPassword.Password == "")
                {
                    MessageBox.Show("Заполните все поля", "Ошибка входа", MessageBoxButton.OK, MessageBoxImage.Hand);
                }
                else
                {
                    var users = App.demEntities.Users.FirstOrDefault(c => c.login == tbLogin.Text & c.password == pbPassword.Password);
                    if (users != null)
                    {
                        identity = users.userID;
                        switch (users.idType)
                        {
                            
                            case 1:
                                WinClient winClient = new WinClient(identity);
                                winClient.Show();
                                Close();
                                break;
                            case 2:
                                WinMaster winMaster = new WinMaster();
                                winMaster.Show();
                                Close();
                                break;
                            case 3:
                                MessageBox.Show("Данный пользователь не существует в системе", "Ошибка входа", MessageBoxButton.OK, MessageBoxImage.Hand);
                                break;
                            case 4:
                                WinOperator winOperator = new WinOperator();
                                winOperator.Show();
                                Close();
                                break;
                        }
                    }
                    else
                    {
                        MessageBox.Show("Неверно введен логин или пароль", "Ошибка входа", MessageBoxButton.OK, MessageBoxImage.Hand);
                    }
                }
                
            }
            catch
            {

            }
        }
    }
}
